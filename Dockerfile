FROM python:3.11-slim

WORKDIR /app

# Install git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Clone the RSS bot
RUN git clone https://github.com/Rongronggg9/RSS-to-Telegram-Bot.git .

# Install requirements
RUN pip install --no-cache-dir -r requirements.txt

# Create config directory
RUN mkdir -p /app/config

# Expose port for Render
EXPOSE 8080

# Start bot
CMD ["python", "-u", "telegramRSSbot.py"]
