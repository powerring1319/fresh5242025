#!/bin/bash

# Create bin directory
mkdir -p bin

# Download Chromium
curl -Lo bin/chrome.zip https://download-chromium.appspot.com/dl/Linux_x64
unzip -q bin/chrome.zip -d bin/
mv bin/chrome-linux/chrome bin/chrome
chmod +x bin/chrome

# Download matching ChromeDriver (v114 example, change if needed)
CHROMEDRIVER_VERSION=114.0.5735.90
curl -Lo bin/chromedriver.zip https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip
unzip -q bin/chromedriver.zip -d bin/
chmod +x bin/chromedriver

echo "✅ Chromium and ChromeDriver installed"
