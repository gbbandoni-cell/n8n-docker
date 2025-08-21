# Use Node 22 (n8n new versions require Node >= 20)
FROM node:22-alpine

ENV NODE_ENV=production

# Working directory
WORKDIR /app

# Install n8n globally
RUN npm install -g n8n

# Add the start script that maps Render's $PORT into N8N_PORT and runs n8n
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Default port (for local/dev only). Render will inject $PORT.
EXPOSE 5678

# IMPORTANT: keep Render's "Docker Command" empty.
CMD ["start.sh"]
