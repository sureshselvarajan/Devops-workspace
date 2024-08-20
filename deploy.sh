#!/bin/bash

# Server details
SERVER_USER=ubuntu
SERVER_HOST=13.232.36.156
DEPLOY_PATH=/var/www/html/Devops-workspace
PEM_KEY_PATH=/var/www/html/autodeploy-key.pem

# Git repository details
REPO_URL=git@github.com:sureshselvarajan/Devops-workspace.git
BRANCH=release

# Deployment functions
deploy() {
  ssh -i "$PEM_KEY_PATH" $SERVER_USER@$SERVER_HOST "
    cd $DEPLOY_PATH
    git pull origin $BRANCH
    # Additional deployment steps, e.g.,
    # mvn clean package
    # systemctl restart your_service
  "
}

deploy