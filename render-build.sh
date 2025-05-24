#!/usr/bin/env bash
set -o errexit
set -o xtrace  # Echo all commands

# Install Chromium and dependencies
apt-get update
apt-get install -y wget unzip curl ca-certificates fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 \
    libatk1.0-0 libcups2 libdbus-1-3 libgdk-pixbuf2.0-0 libnspr4 libnss3 libxcomposite1 libxdamage1 \
    libxrandr2 xdg-utils libu2f-udev libvulkan1 chromium chromium-driver

# Link Chromium and Chromedriver to standard locations
ln -sf /usr/bin/chromium /usr/local/bin/google-chrome
ln -sf /usr/lib/chromium/chromedriver /usr/local/bin/chromedriver

# Confirm installation
which chromium || echo "Chromium not found"
which chromedriver || echo "Chromedriver not found"
which google-chrome || echo "Google Chrome not found"

# Install Python dependencies
poetry install --no-root
