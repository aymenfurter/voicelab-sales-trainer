#!/bin/bash

echo "🧹 Cleaning previous build..."
rm -rf static/js static/assets node_modules package-lock.json

echo "📦 Installing dependencies..."
npm install --legacy-peer-deps

echo "🔨 Building React app..."
npm run build

echo "✅ Build complete! Run 'python app.py' to start the server."
