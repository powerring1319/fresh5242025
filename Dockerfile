FROM python:3.11-slim

# Install Chromium and ChromeDriver
RUN apt-get update && apt-get install -y \
    chromium chromium-driver \
    wget curl unzip \
    libglib2.0-0 libnss3 libgconf-2-4 libfontconfig1 libxss1 \
    libappindicator3-1 libasound2 libatk1.0-0 libcups2 libxrandr2 \
    libxdamage1 libxcomposite1 libx11-xcb1 libxtst6 libpci3 \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set environment variables for Selenium
ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER_PATH=/usr/lib/chromium/chromedriver
ENV PATH=$CHROMEDRIVER_PATH:$PATH

WORKDIR /app

COPY . .

# Install Poetry and Python dependencies
RUN pip install --upgrade pip && pip install poetry && poetry install --no-root

CMD ["poetry", "run", "python", "main.py"]
