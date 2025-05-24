#!/usr/bin/env bash
set -o errexit
set -o xtrace  # Echo all commands for debugging

# Install required system packages
apt-get update
apt-get install -y chromium wget unzip curl

# Get Chrome version for chromedriver match (fallback version if needed)
CHROMEDRIVER_VERSION=$(curl -sSL https://chromedriver.storage.googleapis.com/LATEST_RELEASE)

# Download and extract Chromedriver
wget -O /tmp/chromedriver.zip "https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip"
unzip /tmp/chromedriver.zip -d /tmp/
chmod +x /tmp/chromedriver
mv /tmp/chromedriver /usr/local/bin/chromedriver

# Log installed files
ls -l /usr/local/bin/chromedriver
which chromium || which chromium-browser || echo "Chromium not found"

# Install Python dependencies
poetry install --no-root
