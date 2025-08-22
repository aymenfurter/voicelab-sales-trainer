# Multi-stage build for VoiceLab Sales Trainer
# Stage 1: Build the frontend
FROM node:20-alpine AS frontend-builder

WORKDIR /app

# Configure npm to bypass SSL issues in build environment
RUN npm config set strict-ssl false

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci --legacy-peer-deps --include=dev

# Copy source code and build frontend
COPY src/ ./src/
COPY index.html ./
COPY vite.config.ts ./
COPY tsconfig.json ./
COPY tsconfig.node.json ./
COPY eslint.config.js ./
COPY .prettierrc ./
COPY .prettierignore ./

# Build the frontend
RUN npx --yes tsc && npx --yes vite build

# Stage 2: Python runtime
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    FLASK_APP=app.py \
    FLASK_ENV=production \
    PIP_TRUSTED_HOST="pypi.org files.pythonhosted.org pypi.python.org" \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    ca-certificates \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd --create-home --shell /bin/bash app

WORKDIR /app

# Copy requirements and install Python dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org -r requirements.txt

# Copy application code
COPY --chown=app:app *.py ./
COPY --chown=app:app templates/ ./templates/
COPY --chown=app:app scenarios/ ./scenarios/

# Copy built frontend from previous stage
COPY --from=frontend-builder --chown=app:app /app/static/ ./static/

# Switch to non-root user
USER app

# Expose port
EXPOSE 8000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8000/api/config || exit 1

# Start the application
CMD ["python", "app.py"]