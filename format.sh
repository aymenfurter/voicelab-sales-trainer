#!/bin/bash

# Format script for both Python and TypeScript code

set -e

echo "🔧 Formatting Python code..."

# Run black
echo "Running black..."
black . --config pyproject.toml

echo "🔧 Formatting TypeScript code..."

# Run Prettier
echo "Running prettier..."
npx prettier --write "src/**/*.{ts,tsx,js,jsx,json,css,md}"

echo "✅ All code formatted!"