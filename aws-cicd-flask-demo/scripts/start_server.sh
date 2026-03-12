#!/bin/bash
# This line tells Linux to execute this script using the Bash shell.

set -e
# set -e makes the script exit immediately if any command fails.
# This helps CodeDeploy detect deployment failures early.

echo "Starting Flask application with Gunicorn..."
# echo prints a message to the terminal/logs so we know which step is running.

cd /home/ubuntu/aws-cicd-flask-demo
# Change directory to the application folder.
# Our Flask application (app.py) and requirements.txt are located here.

# Start the Flask application using Gunicorn.
# Gunicorn is a production-ready Python web server for running Flask apps.

nohup gunicorn -w 2 -b 0.0.0.0:8000 app:app > /home/ubuntu/aws-cicd-flask-demo/app.log 2>&1 &

# Explanation of the above command:

# nohup
# Prevents the process from stopping when the deployment script finishes.
# Without this, the application might stop when CodeDeploy exits the shell.

# gunicorn
# Starts the Gunicorn WSGI server which will run our Flask application.

# -w 2
# Starts 2 worker processes to handle incoming HTTP requests.

# -b 0.0.0.0:8000
# Bind the server to IP address 0.0.0.0 and port 8000.
# 0.0.0.0 means the application will accept requests from outside the EC2 instance.

# app:app
# Format: <python_file>:<flask_app_variable>
# First "app" refers to the file app.py
# Second "app" refers to the Flask object created in that file.

# > /home/ubuntu/aws-cicd-flask-demo/app.log
# Redirects the normal output (stdout) of Gunicorn to a log file.

# 2>&1
# Redirects error output (stderr) to the same log file.

# &
# Runs the Gunicorn process in the background so the script can finish.
# This allows CodeDeploy to continue with the deployment lifecycle.
