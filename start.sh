#!/bin/sh
set -e

# Ensure n8n listens on all interfaces
export N8N_HOST=0.0.0.0

# Map Render's $PORT to n8n expected port
export N8N_PORT="${PORT:-5678}"

# If Render gives a public URL, reuse it for webhooks (optional)
if [ -n "$RENDER_EXTERNAL_URL" ] && [ -z "$WEBHOOK_URL" ]; then
  export WEBHOOK_URL="$RENDER_EXTERNAL_URL"
fi

# Silence permission warning (recommended)
export N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS="${N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS:-true}"

# Start n8n
exec n8n
