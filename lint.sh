#!/bin/bash

# Lint script for both Python and TypeScript code

set -e

echo "🔍 Running Python linting..."

# Run flake8
echo "Running flake8..."
flake8 . --config=.flake8

echo "🔍 Running TypeScript linting..."

# Run ESLint
echo "Running ESLint..."
npx eslint . --ext .ts,.tsx

echo "✅ All linting checks passed!"