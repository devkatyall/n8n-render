# Start from the official n8n base image
FROM docker.io/n8nio/n8n:latest

# Switch to the root user temporarily for system modification
USER root

# 1. Create a safe directory for custom Node modules
RUN mkdir -p /opt/n8n/custom-modules

# 2. Change the current working directory to this new, clean location
WORKDIR /opt/n8n/custom-modules

# 3. Install firebase-admin here. This avoids the "workspace" error 
#    because it is run outside of n8n's source directory.
RUN npm install firebase-admin

# 4. CRITICAL STEP: Set the NODE_PATH environment variable
#    This tells the Node.js runtime (which runs your n8n Code Node) 
#    to look inside this custom directory for modules.
ENV NODE_PATH="/usr/local/lib/node_modules:/opt/n8n/custom-modules/node_modules"

# Switch back to the non-root user (node) for security
USER node

# Reset the working directory to the original n8n entry point
WORKDIR /usr/local/lib/node_modules/n8n
