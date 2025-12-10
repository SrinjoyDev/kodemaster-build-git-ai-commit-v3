#!/bin/sh
#
# Compiles your code. This script is run before each test.
#
set -e

cd "$(dirname "$0")/.."

# Install dependencies if not present
if [ ! -d "node_modules" ] && [ ! -L "node_modules" ]; then
    echo "Installing dependencies..."
    npm install --prefer-offline --no-audit --no-fund --progress=false --loglevel=error 2>/dev/null || true
fi

# Compile TypeScript
echo "Compiling..."
npm run build

