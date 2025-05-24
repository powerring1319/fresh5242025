#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

# Create a bin directory for downloaded executables
mkdir -p bin

# Download Chromium (HeadlessShell) from Google storage
curl -Lo bin/chrome.zip https://storage.googleapis.com/chromium-browser-snapshots/Linux_x64/1181205/headless_shell.zip
unzip bin/chrome.zip -d bin/
mv bin/headless_shell bin/chrome

# Download Chromedriver (match with Chromium version if possible)
CHROMEDRIVER_VERSION=$(curl -sSL https://chromedriver.storage.googleapis.com/LATEST_RELEASE)
curl -Lo bin/chromedriver.zip "https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip"
unzip bin/chromedriver.zip -d bin/
chmod +x bin/chrome bin/chromedriver

# Add to PATH
echo "export PATH=$PWD/bin:\$PATH" >> ~/.profile
export PATH=$PWD/bin:$PATH

# Install Python dependencies
poetry install --no-root
