#!/usr/bin/env bash

PLIST_DIR="/Library/LaunchDaemons"

sudo launchctl bootout system "${PLIST_DIR}/com.example.kanata.plist" 2>/dev/null || true
sudo launchctl bootstrap system "${PLIST_DIR}/com.example.kanata.plist"
sudo launchctl enable system/com.example.kanata
