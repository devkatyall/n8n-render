FROM n8nio/n8n:latest

# Set the timezone
ENV GENERIC_TIMEZONE="America/Edmonton"

# Expose default port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
