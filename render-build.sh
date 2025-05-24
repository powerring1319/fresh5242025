#!/usr/bin/env bash
set -o errexit
set -o xtrace

# Install Chromium and required tools
apt-get update
apt-get install -y wget unzip curl gnupg ca-certificates fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libcups2 libdbus-1-3 libgdk-pixbuf2.0-0 libnspr4 libnss3 libx11-xcb1 libxcomposite1 libxdamage1 libxrandr2 xdg-utils

# Install Google Chrome
curl -sSL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/chrome-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

apt-get update
apt-get install -y google-chrome-stable

# Install matching ChromeDriver
CHROME_VERSION=$(google-chrome --version | grep -oP '\d+\.\d+\.\d+')
CHROMEDRIVER_VERSION=$(curl -sSL "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_${CHROME_VERSION}")
wget -O /tmp/chromedriver.zip "https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip"
unzip /tmp/chromedriver.zip -d /usr/local/bin/
chmod +x /usr/local/bin/chromedriver

# Log binary locations
which google-chrome
which chromedriver

# Link chrome to chromium if needed
ln -sf $(which google-chrome) /usr/bin/chromium

# Install Python dependencies
poetry install --no-root
