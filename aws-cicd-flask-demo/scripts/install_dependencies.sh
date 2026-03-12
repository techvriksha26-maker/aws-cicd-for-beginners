#!/bin/bash
set -e

echo "Installing Python dependencies..."

APP_DIR="/home/ubuntu/aws-cicd-flask-demo"

cd $APP_DIR

# install venv support if missing
sudo apt-get update
sudo apt-get install -y python3-venv

# create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# activate venv
source venv/bin/activate

# upgrade pip
pip install --upgrade pip

# install requirements
pip install -r requirements.txt

echo "Dependencies installed successfully."
