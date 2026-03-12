#!/bin/bash
set -e

echo "Validating application on port 8000..."

if curl -f http://localhost:8000/ ; then
    echo "SUCCESS: Application is running correctly."
else
    echo "ERROR: Application validation failed. Server not responding."
    exit 1
fi
