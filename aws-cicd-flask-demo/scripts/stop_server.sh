#!/bin/bash
set -e

echo "Stopping existing application if running..."

pkill -f "gunicorn.*8000" || true
pkill -f "python3 app.py" || true
