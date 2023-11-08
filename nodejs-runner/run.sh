#!/usr/bin/with-contenv bashio

# Read the repository, branch, and port from the options
PRERUN_SCRIPT_NAME=$(bashio::config 'prerun_script_name')
SCRIPT_NAME=$(bashio::config 'script_name')
REPOSITORY=$(bashio::config 'repository')
BRANCH=$(bashio::config 'branch')
PORT=$(bashio::config 'port')

# Clone the repository
git clone --branch "$BRANCH" "$REPOSITORY" /app

# Navigate to the app directory
cd /app

# Install dependencies
npm install

npm run $PRERUN_SCRIPT_NAME

# Start the application using NPM
npm run $SCRIPT_NAME -- --port "$PORT"
