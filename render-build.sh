#!/usr/bin/env bash
set -o errexit
set -o xtrace

# Install Chromium and Chromedriver
apt-get update

# Try both common Chromium paths and drivers
apt-get install -y chromium-browser chromium-chromedriver wget unzip curl

# Symlink to expected paths for compatibility
ln -sf /usr/bin/chromium-browser /usr/bin/chromium || true
ln -sf /usr/lib/chromium-browser/chromedriver /usr/local/bin/chromedriver || true
ln -sf /usr/lib/chromium/chromedriver /usr/local/bin/chromedriver || true

# Log installed versions for debugging
which chromium || which chromium-browser || echo "Chromium not found"
chromium-browser --version || chromium --version || true
chromedriver --version || true

# Install Python dependencies
poetry install --no-root
