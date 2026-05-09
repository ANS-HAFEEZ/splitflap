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
#pragma once

#include <Arduino.h>
#include <WebServer.h>
#include <WiFi.h>

#include <json11.hpp>

#include "../core/logger.h"
#include "../core/splitflap_task.h"
#include "../core/task.h"

#include "display_task.h"
#include "wifi_manager.h"

class HTTPServerTask : public Task<HTTPServerTask> {
    friend class Task<HTTPServerTask>;

    public:
        HTTPServerTask(SplitflapTask& splitflapTask, DisplayTask& displayTask, Logger& logger, const uint8_t taskCore);

    protected:
        void run();

    private:
        SplitflapTask& splitflap_task_;
        DisplayTask& display_task_;
        Logger& logger_;
        WifiManager wifi_manager_;
        WebServer server_;

        void connectWifi();
        void setupRoutes();

        void handleRoot();
        void handleCommand();
        void handleCalibrate();
        void handleState();
        void handleNotFound();
        void claimDevice();
        void pollDisplay();

        String mac_no_colons_;
        uint32_t last_poll_time_ = 0;
        String last_display_value_;
};
