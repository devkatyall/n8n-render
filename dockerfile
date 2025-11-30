# Start from the official n8n base image
FROM docker.io/n8nio/n8n:latest

# Set the working directory
WORKDIR /usr/local/lib/node_modules/n8n

# Install firebase-admin and its required dependencies globally
# The 'n8n' user is used inside the container, so we must switch to root temporarily
USER root

# Install the dependencies. We install them globally in the n8n directory
RUN npm install firebase-admin --location=global

# Switch back to the non-root user for security (n8n user)
USER node
