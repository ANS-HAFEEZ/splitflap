/*
   Copyright 2021 Scott Bezek and the splitflap contributors

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/
#if MQTT  // Build flag controls HTTP server task (legacy name from MQTT migration)
#include <ArduinoOTA.h>
#include <HTTPClient.h>
#include <WiFiClientSecure.h>

#include "http_server_task.h"
#include "secrets.h"

#define CLAIM_URL "https://sfdigit.markeeterai.com/app/pair?id="
#define DISPLAY_API_URL "https://sfdigit.markeeterai.com/api/devices/"
#define POLL_INTERVAL_MS 60000

using namespace json11;

HTTPServerTask::HTTPServerTask(SplitflapTask& splitflap_task, DisplayTask& display_task, Logger& logger, const uint8_t task_core) :
        Task("HTTP_SRV", 8192, 1, task_core),
        splitflap_task_(splitflap_task),
        display_task_(display_task),
        logger_(logger),
        server_(HTTP_PORT) {
}

void HTTPServerTask::connectWifi() {
    char buf[256];

    display_task_.setMessage(0, "WiFi: checking saved creds...");

    if (wifi_manager_.begin(15000)) {
        snprintf(buf, sizeof(buf), "Connected to %s", wifi_manager_.getSSID().c_str());
        logger_.log(buf);
        snprintf(buf, sizeof(buf), "Wifi IP: %s", WiFi.localIP().toString().c_str());
        logger_.log(buf);
        mac_no_colons_ = WiFi.macAddress();
        mac_no_colons_.replace(":", "");
        snprintf(buf, sizeof(buf), "MAC: %s", WiFi.macAddress().c_str());
        logger_.log(buf);
        display_task_.setMessage(0, String(buf));
    } else {
        display_task_.setMessage(0, "WiFi AP mode - configure via 192.168.4.1");
    }
}

void HTTPServerTask::handleRoot() {
    char buf[512];
    SplitflapState state = splitflap_task_.getState();
    char flap_buf[NUM_MODULES + 1];
    for (uint8_t i = 0; i < NUM_MODULES; i++) {
        flap_buf[i] = flaps[state.modules[i].flap_index];
    }
    flap_buf[NUM_MODULES] = 0;

    snprintf(buf, sizeof(buf),
        "Splitflap HTTP Server\n"
        "=====================\n"
        "Device: %s\n"
        "IP: %s\n"
        "MAC: %s\n"
        "Modules: %d\n"
        "Current: %s\n\n"
        "Endpoints:\n"
        "  POST /api/command   - body: text to display\n"
        "  POST /api/calibrate - body: home|save|offset_tenth:N|offset_tenth_back:N|offset_half:N|set_offset:N\n"
        "  GET  /api/state     - returns JSON with current state\n",
        DEVICE_INSTANCE_NAME,
        WiFi.localIP().toString().c_str(),
        WiFi.macAddress().c_str(),
        NUM_MODULES,
        flap_buf
    );
    server_.send(200, "text/plain", buf);
}

void HTTPServerTask::handleCommand() {
    if (server_.method() != HTTP_POST) {
        server_.send(405, "text/plain", "Method Not Allowed. Use POST.");
        return;
    }

    String body = server_.arg("plain");
    if (body.length() == 0) {
        server_.send(400, "text/plain", "Empty body. Send text to display.");
        return;
    }

    char buf[256];
    snprintf(buf, sizeof(buf), "HTTP command received: %s", body.c_str());
    logger_.log(buf);

    splitflap_task_.showString(body.c_str(), body.length(), false, true);
    server_.send(200, "application/json", "{\"status\":\"ok\"}");
}

void HTTPServerTask::handleCalibrate() {
    if (server_.method() != HTTP_POST) {
        server_.send(405, "text/plain", "Method Not Allowed. Use POST.");
        return;
    }

    String body = server_.arg("plain");
    if (body.length() == 0) {
        server_.send(400, "text/plain", "Empty body. Send calibration command.");
        return;
    }

    char buf[256];
    const char* cmd = body.c_str();
    snprintf(buf, sizeof(buf), "HTTP calibrate command: %s", cmd);
    logger_.log(buf);

    if (strcmp(cmd, "home") == 0) {
        logger_.log("HTTP: Recalibrating all modules");
        splitflap_task_.resetAll();
    } else if (strcmp(cmd, "save") == 0) {
        logger_.log("HTTP: Saving calibration offsets");
        splitflap_task_.saveAllOffsets();
    } else if (strncmp(cmd, "offset_tenth:", 13) == 0) {
        uint8_t module_id = atoi(cmd + 13);
        if (module_id < NUM_MODULES) {
            snprintf(buf, sizeof(buf), "HTTP: Offset +1/10 for module %u", module_id);
            logger_.log(buf);
            splitflap_task_.increaseOffsetTenth(module_id);
        } else {
            server_.send(400, "text/plain", "Invalid module ID");
            return;
        }
    } else if (strncmp(cmd, "offset_tenth_back:", 18) == 0) {
        uint8_t module_id = atoi(cmd + 18);
        if (module_id < NUM_MODULES) {
            snprintf(buf, sizeof(buf), "HTTP: Offset -1/10 for module %u", module_id);
            logger_.log(buf);
            splitflap_task_.decreaseOffsetTenth(module_id);
        } else {
            server_.send(400, "text/plain", "Invalid module ID");
            return;
        }
    } else if (strncmp(cmd, "offset_half:", 12) == 0) {
        uint8_t module_id = atoi(cmd + 12);
        if (module_id < NUM_MODULES) {
            snprintf(buf, sizeof(buf), "HTTP: Offset +1/2 for module %u", module_id);
            logger_.log(buf);
            splitflap_task_.increaseOffsetHalf(module_id);
        } else {
            server_.send(400, "text/plain", "Invalid module ID");
            return;
        }
    } else if (strncmp(cmd, "set_offset:", 11) == 0) {
        uint8_t module_id = atoi(cmd + 11);
        if (module_id < NUM_MODULES) {
            snprintf(buf, sizeof(buf), "HTTP: Set offset for module %u", module_id);
            logger_.log(buf);
            splitflap_task_.setOffset(module_id);
        } else {
            server_.send(400, "text/plain", "Invalid module ID");
            return;
        }
    } else {
        snprintf(buf, sizeof(buf), "Unknown calibrate command: %s", cmd);
        logger_.log(buf);
        server_.send(400, "text/plain", buf);
        return;
    }

    server_.send(200, "application/json", "{\"status\":\"ok\"}");
}

void HTTPServerTask::handleState() {
    SplitflapState state = splitflap_task_.getState();
    char flap_buf[NUM_MODULES + 1];
    bool all_idle = true;
    for (uint8_t i = 0; i < NUM_MODULES; i++) {
        flap_buf[i] = flaps[state.modules[i].flap_index];
        if (state.modules[i].moving) {
            all_idle = false;
        }
    }
    flap_buf[NUM_MODULES] = 0;

    Json response = Json::object {
        { "device", DEVICE_INSTANCE_NAME },
        { "mac", std::string(WiFi.macAddress().c_str()) },
        { "state", std::string(flap_buf) },
        { "modules", (int)NUM_MODULES },
        { "idle", all_idle },
    };

    server_.send(200, "application/json", response.dump().c_str());
}

void HTTPServerTask::handleNotFound() {
    server_.send(404, "text/plain", "Not Found");
}

void HTTPServerTask::claimDevice() {
    char buf[256];
    String url = String(CLAIM_URL) + mac_no_colons_;

    snprintf(buf, sizeof(buf), "Claiming device at: %s", url.c_str());
    logger_.log(buf);
    display_task_.setMessage(1, "Claiming device...");

    WiFiClientSecure secure_client;
    secure_client.setInsecure();
    HTTPClient http;
    http.begin(secure_client, url);
    int http_code = http.GET();

    if (http_code > 0) {
        String response = http.getString();
        snprintf(buf, sizeof(buf), "Claim response (%d): %s", http_code, response.c_str());
        logger_.log(buf);
        display_task_.setMessage(1, "Device claimed!");
    } else {
        snprintf(buf, sizeof(buf), "Claim failed: %s", http.errorToString(http_code).c_str());
        logger_.log(buf);
        display_task_.setMessage(1, "Claim failed");
    }
    http.end();
}

void HTTPServerTask::pollDisplay() {
    char buf[256];
    String url = String(DISPLAY_API_URL) + mac_no_colons_ + "/display";

    WiFiClientSecure secure_client;
    secure_client.setInsecure();
    HTTPClient http;
    http.begin(secure_client, url);
    int http_code = http.GET();

    if (http_code == 200) {
        String body = http.getString();
        body.trim();

        std::string err;
        Json json = Json::parse(body.c_str(), err);
        if (!err.empty()) {
            snprintf(buf, sizeof(buf), "Poll JSON parse error: %s", err.c_str());
            logger_.log(buf);
        } else {
            int count = (int)json["count"].number_value();
            char display_buf[NUM_MODULES + 1];
            snprintf(display_buf, sizeof(display_buf), "%0*d", NUM_MODULES, count);

            String count_str = String(display_buf);
            if (count_str != last_display_value_) {
                last_display_value_ = count_str;
                snprintf(buf, sizeof(buf), "Poll display count: %s", display_buf);
                logger_.log(buf);
                splitflap_task_.showString(display_buf, NUM_MODULES, false, false);
            }
        }
    } else if (http_code > 0) {
        snprintf(buf, sizeof(buf), "Poll response: %d", http_code);
        logger_.log(buf);
    } else {
        snprintf(buf, sizeof(buf), "Poll failed: %s", http.errorToString(http_code).c_str());
        logger_.log(buf);
    }
    http.end();
}

void HTTPServerTask::setupRoutes() {
    server_.on("/", [this]() { handleRoot(); });
    server_.on("/api/command", [this]() { handleCommand(); });
    server_.on("/api/calibrate", [this]() { handleCalibrate(); });
    server_.on("/api/state", [this]() { handleState(); });
    server_.onNotFound([this]() { handleNotFound(); });
}

void HTTPServerTask::run() {
    char buf[256];
    display_task_.setMessage(0, "");
    display_task_.setMessage(1, "");
    connectWifi();
    claimDevice();

    setupRoutes();
    server_.begin();
    snprintf(buf, sizeof(buf), "HTTP server on port %d", HTTP_PORT);
    logger_.log(buf);
    snprintf(buf, sizeof(buf), "HTTP: %s:%d", WiFi.localIP().toString().c_str(), HTTP_PORT);
    display_task_.setMessage(1, String(buf));

    ArduinoOTA
        .onStart([this]() {
            if (ArduinoOTA.getCommand() == U_FLASH) {
                logger_.log("Start OTA (flash)");
            } else {
                logger_.log("Start OTA (filesystem)");
            }
        })
        .onEnd([this]() {
            logger_.log("OTA End");
        })
        .onProgress([this](unsigned int progress, unsigned int total) {
            char buf2[256];
            static uint32_t last_progress;
            if (millis() - last_progress > 1000) {
                snprintf(buf2, sizeof(buf2), "OTA Progress: %d%%", (int)(progress * 100 / total));
                logger_.log(buf2);
                last_progress = millis();
            }
        })
        .onError([this](ota_error_t error) {
            char buf2[256];
            snprintf(buf2, sizeof(buf2), "OTA Error: %u", error);
            logger_.log(buf2);
            if (error == OTA_AUTH_ERROR) logger_.log("Auth Failed");
            else if (error == OTA_BEGIN_ERROR) logger_.log("Begin Failed");
            else if (error == OTA_CONNECT_ERROR) logger_.log("Connect Failed");
            else if (error == OTA_RECEIVE_ERROR) logger_.log("Receive Failed");
            else if (error == OTA_END_ERROR) logger_.log("End Failed");
        })
        .setHostname(DEVICE_INSTANCE_NAME)
        .setPassword(OTA_PASSWORD)
        .begin();

    wl_status_t wifi_last_status = WL_DISCONNECTED;
    uint32_t last_reconnect_attempt = 0;
    bool was_connected = false;

    while(1) {
        wl_status_t wifi_new_status = WiFi.status();
        if (wifi_new_status != wifi_last_status) {
            if (wifi_new_status == WL_CONNECTED) {
                snprintf(buf, sizeof(buf), "Wifi IP: %s", WiFi.localIP().toString().c_str());
                logger_.log(buf);
                display_task_.setMessage(0, String(buf));
                snprintf(buf, sizeof(buf), "HTTP: %s:%d", WiFi.localIP().toString().c_str(), HTTP_PORT);
                display_task_.setMessage(1, String(buf));
                if (!was_connected) {
                    was_connected = true;
                } else {
                    logger_.log("WiFi reconnected, re-claiming device");
                    claimDevice();
                }
            } else {
                if (wifi_last_status == WL_CONNECTED) {
                    logger_.log("WiFi connection lost");
                }
                snprintf(buf, sizeof(buf), "Wifi reconnecting to %s", wifi_manager_.getSSID().c_str());
                display_task_.setMessage(0, String(buf));
                display_task_.setMessage(1, "HTTP: waiting for WiFi...");
            }
            wifi_last_status = wifi_new_status;
        }

        if (wifi_new_status != WL_CONNECTED && (millis() - last_reconnect_attempt) > 10000) {
            last_reconnect_attempt = millis();
            logger_.log("Attempting WiFi reconnect...");
            WiFi.disconnect();
            WiFi.begin(wifi_manager_.getSSID().c_str(), wifi_manager_.getPassword().c_str());
        }

        if (wifi_new_status == WL_CONNECTED && (millis() - last_poll_time_) > POLL_INTERVAL_MS) {
            last_poll_time_ = millis();
            pollDisplay();
        }

        server_.handleClient();
        ArduinoOTA.handle();
        delay(1);
    }
}

#endif
