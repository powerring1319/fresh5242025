#!/usr/bin/env bash
set -o errexit
set -o xtrace

# Install Chromium & Chromedriver
apt-get update
apt-get install -y wget unzip curl gnupg

# Add Chromium stable source and install it
curl -sSL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/chrome-keyring.gpg
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main' \
    > /etc/apt/sources.list.d/google-chrome.list

apt-get update
apt-get install -y google-chrome-stable

# Install matching Chromedriver
CHROME_VERSION=$(google-chrome --version | grep -oP "\d+\.\d+\.\d+")
CHROMEDRIVER_VERSION=$(curl -sSL "https://chromedriver.storage.googleapis.com/LATEST_RELEASE_${CHROME_VERSION}")
wget -O /tmp/chromedriver.zip "https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip"
unzip /tmp/chromedriver.zip -d /usr/local/bin/
chmod +x /usr/local/bin/chromedriver

# Link the browser for Selenium
ln -sf /usr/bin/google-chrome /usr/bin/chromium || true

# Install Python deps
poetry install --no-root
