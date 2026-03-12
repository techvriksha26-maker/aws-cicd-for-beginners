#!/bin/bash
set -e

echo "Installing Python dependencies..."

cd /home/ubuntu/aws-cicd-flask-demo

pip3 install -r requirements.txt

