#!/usr/bin/env bash
set -o errexit
set -o xtrace

# Install Chromium and Chromedriver
apt-get update
apt-get install -y wget unzip curl chromium chromium-driver

# Verify installation
which chromium || which chromium-browser || echo "Chromium not found"
which chromedriver || echo "Chromedriver not found"

# Make sure chromedriver is executable
chmod +x "$(which chromedriver)"

# Install Python dependencies
poetry install --no-root
