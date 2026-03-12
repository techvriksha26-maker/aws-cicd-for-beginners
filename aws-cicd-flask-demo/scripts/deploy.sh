#!/bin/bash
set -e

APP_DIR="/home/ubuntu/aws-cicd-flask-demo"
SCRIPTS_DIR="$APP_DIR/scripts"

echo "======================================"
echo " Starting Deployment"
echo "======================================"

cd $APP_DIR

#############################################
echo "Stage 1: ApplicationStop"
#############################################
if [ -f "$SCRIPTS_DIR/stop_server.sh" ]; then
    bash $SCRIPTS_DIR/stop_server.sh
else
    echo "No stop_server.sh found. Skipping."
fi

#############################################
echo "Stage 2: BeforeInstall"
#############################################
if [ -f "$SCRIPTS_DIR/install_dependencies.sh" ]; then
    bash $SCRIPTS_DIR/install_dependencies.sh
else
    echo "No install_dependencies.sh found. Skipping."
fi

#############################################
echo "Stage 3: AfterInstall"
#############################################
echo "Files already copied by CodePipeline EC2 deploy action."

#############################################
echo "Stage 4: ApplicationStart"
#############################################
if [ -f "$SCRIPTS_DIR/start_server.sh" ]; then
    bash $SCRIPTS_DIR/start_server.sh
else
    echo "No start_server.sh found."
    exit 1
fi

#############################################
echo "Stage 5: ValidateService"
#############################################
if [ -f "$SCRIPTS_DIR/validate_service.sh" ]; then
    bash $SCRIPTS_DIR/validate_service.sh
else
    echo "No validate_service.sh found."
    exit 1
fi

echo "======================================"
echo " Deployment Completed Successfully"
echo "======================================"
