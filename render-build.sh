#!/usr/bin/env bash
set -o errexit
set -o xtrace  # Echo all commands for debugging

# Update system and install Chromium + matching chromedriver
apt-get update
apt-get install -y chromium chromium-driver wget unzip curl

# Ensure correct symlinks
ln -sf /usr/bin/chromium /usr/bin/google-chrome
ln -sf /usr/lib/chromium/chromedriver /usr/local/bin/chromedriver

# Log check
ls -l /usr/local/bin/chromedriver
which chromium || which chromium-browser || echo "Chromium not found"
chromium --version || true
chromedriver --version || true

# Install Python dependencies
poetry install --no-root
