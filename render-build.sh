#!/usr/bin/env bash

# Exit on error
set -o errexit

# Install Chromium and Chromedriver
apt-get update
apt-get install -y wget unzip curl
apt-get install -y chromium chromium-driver

# Set environment variables
export CHROME_BIN=/usr/bin/chromium
export PATH=$PATH:/usr/lib/chromium

# Install project dependencies
poetry install --no-root
