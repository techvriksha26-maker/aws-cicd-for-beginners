#!/bin/bash
set -e

echo "Validating Flask service..."

for i in {1..10}; do
    if curl -f http://127.0.0.1:8000/; then
        echo ""
        echo "Validation successful."
        exit 0
    fi
    echo "Attempt $i failed, waiting 3 seconds..."
    sleep 3
done

echo "Validation failed after multiple attempts."
exit 1
