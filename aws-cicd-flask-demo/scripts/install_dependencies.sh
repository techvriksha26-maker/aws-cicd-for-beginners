#!/bin/bash
set -e

echo "Installing Python dependencies..."

cd /home/ubuntu/aws-cicd-flask-demo

python3 -m pip install --upgrade pip
pip3 install -r requirements.txt

