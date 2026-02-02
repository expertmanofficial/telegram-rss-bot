#!/bin/bash

# Start a simple HTTP server in background (for Render health checks)
python3 -m http.server 8080 &

# Start the RSS bot
python -u telegramRSSbot.py
