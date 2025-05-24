#!/usr/bin/env bash
set -o errexit
set -o xtrace  # Echo all commands for debugging

# Create bin directory if it doesn't exist
mkdir -p bin

# Download latest Chromedriver version
CHROMEDRIVER_VERSION=$(curl -sSL https://chromedriver.storage.googleapis.com/LATEST_RELEASE)
wget -O /tmp/chromedriver.zip "https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip"
unzip /tmp/chromedriver.zip -d /tmp/
mv /tmp/chromedriver bin/chromedriver

# Download Chromium using Puppeteer's Node script (small headless Chromium build)
curl -o bin/chrome.zip https://storage.googleapis.com/chromium-browser-snapshots/Linux_x64/1193135/chrome-linux.zip
unzip -q bin/chrome.zip -d bin/
mv bin/chrome-linux/chrome bin/chrome
rm -rf bin/chrome-linux bin/chrome.zip

# Make Chromium and Chromedriver executable
chmod +x bin/chrome
chmod +x bin/chromedriver

# Log paths to confirm
echo "✅ chromium path: $(realpath bin/chrome)"
echo "✅ chromedriver path: $(realpath bin/chromedriver)"

# Install Python dependencies using Poetry
poetry install --no-root
