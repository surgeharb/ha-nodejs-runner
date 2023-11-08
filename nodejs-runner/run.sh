#!/usr/bin/with-contenv bashio

# Read the repository, branch, port, and bun from the options
PRERUN_SCRIPT_NAME=$(bashio::config 'prerun_script_name')
SCRIPT_NAME=$(bashio::config 'script_name')
REPOSITORY=$(bashio::config 'repository')
BRANCH=$(bashio::config 'branch')
PORT=$(bashio::config 'port')
BUN=$(bashio::config 'bun')

echo "1: Cloning the repository"
git clone --branch "$BRANCH" "$REPOSITORY" /app

echo "2: Navigating to the app directory"
cd /app || exit

echo "3: Installing dependencies"
if [ "$BUN" = true ]; then
    echo "Installing dependencies using bun..."
    npx bun install
else
    echo "Installing dependencies using npm..."
    npm install
fi

echo "4: Running the pre-run script if it exists ($PRERUN_SCRIPT_NAME)"
if [ -n "$PRERUN_SCRIPT_NAME" ]; then
    if [ "$BUN" = true ]; then
        echo "Running pre-run script using bun..."
        npx bun run "$PRERUN_SCRIPT_NAME"
    else
        echo "Running pre-run script using npm..."
        npm run "$PRERUN_SCRIPT_NAME"
    fi
else
    echo "No pre-run script found."
fi

echo "5: Starting the application"
if [ "$BUN" = true ]; then
    echo "Using bun..."
    npx bun run "$SCRIPT_NAME" --port "$PORT"
else
    echo "Using npm..."
    npm run "$SCRIPT_NAME" -- --port "$PORT"
fi
