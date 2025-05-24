#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

# Install Chromium dependencies
apt-get update
apt-get install -y \
  chromium-browser \
  chromium-chromedriver \
  fonts-liberation \
  libappindicator3-1 \
  libasound2 \
  libatk-bridge2.0-0 \
  libatk1.0-0 \
  libcups2 \
  libdbus-1-3 \
  libgdk-pixbuf2.0-0 \
  libnspr4 \
  libnss3 \
  libx11-xcb1 \
  libxcomposite1 \
  libxdamage1 \
  libxrandr2 \
  xdg-utils \
  wget \
  unzip \
  curl

# Verify installation
which chromium-browser || echo "❌ chromium-browser not found"
which chromedriver || echo "❌ chromedriver not found"

# Optional: create symlinks if needed
ln -sf "$(which chromium-browser)" /usr/bin/chromium
ln -sf "$(which chromedriver)" /usr/bin/chromedriver

# Install Python dependencies
poetry install --no-root
