FROM n8nio/n8n:latest-debian

# Set timezone
ENV GENERIC_TIMEZONE="America/Edmonton"

# Expose n8n port
EXPOSE 5678

# Start n8n via PM2 (recommended for Render)
CMD ["pm2-runtime", "n8n"]
