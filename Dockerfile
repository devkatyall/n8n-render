# STEP 1 — Use official Node image
FROM node:18-bullseye

# STEP 2 — Install PM2
RUN npm install -g pm2

# STEP 3 — Install n8n globally
RUN npm install -g n8n

# STEP 4 — Create working directory
WORKDIR /data

# STEP 5 — Expose n8n default port
EXPOSE 5678

# STEP 6 — Start n8n via PM2
CMD ["pm2-runtime", "n8n"]
