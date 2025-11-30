# Start from the official n8n base image
FROM docker.io/n8nio/n8n:latest

# Switch to the root user temporarily for system modification
USER root

# CRITICAL FIX: Install firebase-admin directly into n8n's source directory
# 1. Change directory to n8n's source folder.
# 2. Run npm install, which installs the package locally within that folder.
RUN cd /usr/local/lib/node_modules/n8n && npm install firebase-admin

# Clean up npm cache to reduce image size (optional but recommended)
RUN npm cache clean --force

# Switch back to the non-root user (node) for security, as defined in the base image
USER node
