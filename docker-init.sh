#!/bin/sh
# Docker initialization script for texas-dps-scheduler

# --- NEW PART ---
# Create config.yml from Fly secret if present
if [ -n "$CONFIG_YML_B64" ]; then
  echo "$CONFIG_YML_B64" | base64 -d > ./config.yml
fi
# --- END NEW PART ---

# Normal start logic
if [ "$HEADLESS" = "false" ]; then
    echo "Starting with xvfb for non-headless mode..."
    xvfb-run -a -s '-screen 0 1920x1080x24 -ac -nolisten tcp -dpi 96' node index.js
else
    echo "Starting in headless mode..."
    node index.js
fi
