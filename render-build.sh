#!/usr/bin/env bash
set -o errexit

# Install dependencies
apt-get update
apt-get install -y wget unzip curl

# Install Chromium
apt-get install -y chromium

# Install Chromedriver (matching version)
CHROME_VERSION=$(chromium --version | grep -oP '\d+\.\d+\.\d+')
CHROMEDRIVER_VERSION=$(curl -sS "https://googlechromelabs.github.io/chrome-for-testing/LATEST_RELEASE_STABLE")

wget -O chromedriver.zip "https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/${CHROMEDRIVER_VERSION}/linux64/chromedriver-linux64.zip"
unzip chromedriver.zip
mv chromedriver-linux64/chromedriver /usr/local/bin/chromedriver
chmod +x /usr/local/bin/chromedriver
rm -rf chromedriver.zip chromedriver-linux64

# Install Python dependencies
poetry install --no-root
