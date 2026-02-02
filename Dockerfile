FROM python:3.11-slim

WORKDIR /app

# Install git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Clone the RSS bot
RUN git clone https://github.com/Rongronggg9/RSS-to-Telegram-Bot.git .

# Install requirements
RUN pip install --no-cache-dir -r requirements.txt

# Copy startup script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Create config directory
RUN mkdir -p /app/config

# Expose port for Render
EXPOSE 8080

# Start both services
CMD ["/app/start.sh"]
