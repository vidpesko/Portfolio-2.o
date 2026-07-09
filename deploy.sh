#!/bin/bash
set -e  # exit immediately on any error

# ─── CONFIG ───────────────────────────────────────────────────────────────────
APP_DIR="/home/vid/Documents/Portfolio-2.o"   # root of the repo on the server
PM2_NAME="Portfolio"                       # pm2 process name for the SvelteKit app
GIT_BRANCH="master"                        # production branch
# ──────────────────────────────────────────────────────────────────────────────

echo "==> Pulling latest code..."
cd "$APP_DIR"
git pull origin "$GIT_BRANCH"

echo "==> Installing dependencies..."
npm ci

echo "==> Building SvelteKit..."
npm run build

echo "==> Restarting app via PM2..."
pm2 restart "$PM2_NAME" --update-env

# ─── SAVE PM2 STATE ───────────────────────────────────────────────────────────
pm2 save

echo "==> Deploy complete ✓"
