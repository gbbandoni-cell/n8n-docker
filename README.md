# n8n on Render (Docker)

This pack contains everything you need to deploy **n8n** on **Render** using Docker.

## Files
- `Dockerfile` — uses Node 22, installs n8n and sets `start.sh` as CMD.
- `start.sh` — maps Render's `$PORT` into `N8N_PORT` and runs `n8n`.
- `render.yaml` — optional IaC to provision the service on Render with env vars.
- `docker-compose.yml` — optional, for local development with Postgres.
- `.dockerignore` — keeps build context clean.

---

## Step-by-step (Render UI)

1. **Create a GitHub repo** (or reuse your existing) and push these files to the root.
2. On **Render → New → Web Service**:
   - Connect your GitHub.
   - Select the repo & branch (`main`).
   - **Environment**: `Docker`.
   - Plan: `Free` (for tests) or a paid plan to avoid hibernation.
   - Create the service.
3. After the first build finishes, go to **Settings → Environment** and add the environment variables:
   - `N8N_PROTOCOL=https`
   - `N8N_ENCRYPTION_KEY=<32-char-secret>`
   - `GENERIC_TIMEZONE=America/Sao_Paulo`
   - (Production) Postgres:
     - `DB_TYPE=postgresdb`
     - `DB_POSTGRESDB_HOST=<host>`
     - `DB_POSTGRESDB_PORT=5432`
     - `DB_POSTGRESDB_DATABASE=<db>`
     - `DB_POSTGRESDB_USER=<user>`
     - `DB_POSTGRESDB_PASSWORD=<password>`
     - `DB_POSTGRESDB_SCHEMA=public`
     - `DB_POSTGRESDB_SSL=true` (if your provider requires it)
4. **Settings → Docker Command**: leave it **empty**.
5. **Manual Deploy → Deploy latest commit**.
6. Open the service URL: you should see the n8n login screen.

### Notes
- Free plan hibernates after idle; CRONs won't run 24/7. Use a paid plan or ping the app periodically.
- For persistence, use Postgres (recommended) or a Render Disk (paid).
- The container listens on `$PORT` (Render injects it). Do not hardcode ports.
