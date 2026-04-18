/*
   WiFi Manager for Split-flap display
   Stores WiFi credentials in NVS flash.
   Falls back to AP mode with a config web page if no credentials are saved
   or if connection fails.
*/
#pragma once

#include <Arduino.h>
#include <WiFi.h>
#include <Preferences.h>
#include <WebServer.h>

class WifiManager {
public:
    WifiManager();

    // Try to connect using saved credentials. Returns true if connected.
    // If no saved credentials or connection fails, starts AP mode with config portal.
    bool begin(unsigned long timeout_ms = 15000);

    // Returns true if connected to WiFi in station mode
    bool isConnected();

    // Returns the SSID currently connected to (or saved)
    String getSSID();

private:
    Preferences prefs_;
    WebServer server_;

    String saved_ssid_;
    String saved_password_;
    bool ap_mode_;

    bool loadCredentials();
    void saveCredentials(const String& ssid, const String& password);
    bool tryConnect(unsigned long timeout_ms);
    void startAP();
    void setupWebServer();
    void handleRoot();
    void handleSave();
    void handleReboot();
};
