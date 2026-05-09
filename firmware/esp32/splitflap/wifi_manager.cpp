/*
   WiFi Manager for Split-flap display
*/
#include "wifi_manager.h"

static const char* NVS_NAMESPACE = "wificreds";
static const char* AP_SSID = "SplitFlap-Setup";
static const char* AP_PASS = "12345678";

static const char HTML_PAGE[] PROGMEM = R"rawliteral(
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Split-Flap WiFi Setup</title>
<style>
body{font-family:Arial,sans-serif;background:#1a1a2e;color:#eee;display:flex;justify-content:center;align-items:center;min-height:100vh;margin:0}
.card{background:#16213e;padding:30px;border-radius:12px;width:320px;box-shadow:0 4px 20px rgba(0,0,0,.5)}
h1{text-align:center;color:#e94560;margin-top:0;font-size:22px}
label{display:block;margin-top:15px;font-size:14px;color:#a8a8b3}
input[type=text],input[type=password]{width:100%;padding:10px;margin-top:5px;border:1px solid #333;border-radius:6px;background:#0f3460;color:#eee;font-size:16px;box-sizing:border-box}
.btn{display:block;width:100%;padding:12px;margin-top:20px;border:none;border-radius:6px;font-size:16px;cursor:pointer;font-weight:bold}
.save{background:#e94560;color:#fff}
.reboot{background:#0f3460;color:#e94560;border:2px solid #e94560}
.btn:hover{opacity:.85}
.msg{text-align:center;margin-top:10px;font-size:14px;color:#53d769}
</style>
</head>
<body>
<div class="card">
<h1>Split-Flap WiFi Setup</h1>
<form action="/save" method="POST">
<label>WiFi SSID</label>
<input type="text" name="ssid" placeholder="Enter WiFi name" required>
<label>WiFi Password</label>
<input type="password" name="password" placeholder="Enter WiFi password">
<button type="submit" class="btn save">Save &amp; Connect</button>
</form>
<form action="/reboot" method="POST">
<button type="submit" class="btn reboot">Reboot Device</button>
</form>
</div>
</body>
</html>
)rawliteral";

static const char HTML_SAVED[] PROGMEM = R"rawliteral(
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Saved</title>
<style>
body{font-family:Arial,sans-serif;background:#1a1a2e;color:#eee;display:flex;justify-content:center;align-items:center;min-height:100vh;margin:0}
.card{background:#16213e;padding:30px;border-radius:12px;width:320px;text-align:center}
h1{color:#53d769}
p{color:#a8a8b3}
</style>
</head>
<body>
<div class="card">
<h1>Saved!</h1>
<p>WiFi credentials saved. Device will reboot in 3 seconds...</p>
</div>
</body>
</html>
)rawliteral";

WifiManager::WifiManager() : server_(80), ap_mode_(false) {}

bool WifiManager::begin(unsigned long timeout_ms) {
    if (loadCredentials() && saved_ssid_.length() > 0) {
        Serial.printf("[WiFiMgr] Found saved credentials for '%s'\n", saved_ssid_.c_str());
        if (tryConnect(timeout_ms)) {
            return true;
        }
        Serial.println("[WiFiMgr] Connection failed, starting AP mode");
    } else {
        Serial.println("[WiFiMgr] No saved credentials, starting AP mode");
    }

    startAP();
    setupWebServer();

    // Block here serving the config portal until credentials are saved
    while (ap_mode_) {
        server_.handleClient();
        delay(10);
    }

    // After saving, we'll reboot so this won't normally be reached
    return false;
}

bool WifiManager::isConnected() {
    return WiFi.status() == WL_CONNECTED;
}

String WifiManager::getSSID() {
    return saved_ssid_;
}

String WifiManager::getPassword() {
    return saved_password_;
}

bool WifiManager::loadCredentials() {
    prefs_.begin(NVS_NAMESPACE, true); // read-only
    saved_ssid_ = prefs_.getString("ssid", "");
    saved_password_ = prefs_.getString("password", "");
    prefs_.end();
    return saved_ssid_.length() > 0;
}

void WifiManager::saveCredentials(const String& ssid, const String& password) {
    prefs_.begin(NVS_NAMESPACE, false); // read-write
    prefs_.putString("ssid", ssid);
    prefs_.putString("password", password);
    prefs_.end();
    Serial.printf("[WiFiMgr] Credentials saved for '%s'\n", ssid.c_str());
}

bool WifiManager::tryConnect(unsigned long timeout_ms) {
    WiFi.mode(WIFI_STA);
    WiFi.begin(saved_ssid_.c_str(), saved_password_.c_str());
    WiFi.setSleep(WIFI_PS_NONE);

    Serial.printf("[WiFiMgr] Connecting to '%s'...\n", saved_ssid_.c_str());

    unsigned long start = millis();
    while (WiFi.status() != WL_CONNECTED && (millis() - start) < timeout_ms) {
        delay(500);
        Serial.print(".");
    }
    Serial.println();

    if (WiFi.status() == WL_CONNECTED) {
        Serial.printf("[WiFiMgr] Connected! IP: %s\n", WiFi.localIP().toString().c_str());
        return true;
    }

    WiFi.disconnect();
    return false;
}

void WifiManager::startAP() {
    ap_mode_ = true;
    WiFi.mode(WIFI_AP);
    WiFi.softAP(AP_SSID, AP_PASS);
    Serial.printf("[WiFiMgr] AP started: SSID='%s' Password='%s'\n", AP_SSID, AP_PASS);
    Serial.printf("[WiFiMgr] Config page: http://%s\n", WiFi.softAPIP().toString().c_str());
}

void WifiManager::setupWebServer() {
    server_.on("/", HTTP_GET, [this]() { handleRoot(); });
    server_.on("/save", HTTP_POST, [this]() { handleSave(); });
    server_.on("/reboot", HTTP_POST, [this]() { handleReboot(); });
    server_.begin();
    Serial.println("[WiFiMgr] Web server started");
}

void WifiManager::handleRoot() {
    server_.send(200, "text/html", HTML_PAGE);
}

void WifiManager::handleSave() {
    String ssid = server_.arg("ssid");
    String password = server_.arg("password");

    if (ssid.length() > 0) {
        saveCredentials(ssid, password);
        server_.send(200, "text/html", HTML_SAVED);
        delay(3000);
        ESP.restart();
    } else {
        server_.send(400, "text/plain", "SSID cannot be empty");
    }
}

void WifiManager::handleReboot() {
    server_.send(200, "text/plain", "Rebooting...");
    delay(1000);
    ESP.restart();
}
