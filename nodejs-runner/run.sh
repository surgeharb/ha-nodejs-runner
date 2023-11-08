#!/usr/bin/with-contenv bashio

# Read the repository, branch, and port from the options
REPOSITORY=$(bashio::config 'repository')
BRANCH=$(bashio::config 'branch')
PORT=$(bashio::config 'port')

# Clone the repository
git clone --branch "$BRANCH" "$REPOSITORY" /app

# Navigate to the app directory
cd /app

# Install dependencies
npm install

# Start the application using PM2
pm2 start npm --name "app" -- start -- --port "$PORT"

# Save the PM2 process list and gracefully stop PM2 on exit
trap "pm2 save && pm2 stop all && pm2 delete all" SIGTERM SIGHUP
