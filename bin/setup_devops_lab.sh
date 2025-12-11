#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Define the root lab directory location
LAB_ROOT_DIR="$HOME/devops-lab"
REPO_NAME="devops-lab"
REPO_URL="git@github.com:dbuitrago-creator/devops-lab.git"

echo "Ensuring root lab directory exists: $LAB_ROOT_DIR"
mkdir -p "$LAB_ROOT_DIR"

# Navigate to the lab root directory
cd "$LAB_ROOT_DIR"

echo "Attempting to clone repository: $REPO_URL into $LAB_ROOT_DIR"

# Clone the repository only if it doesn't already exist
if [ -d "$REPO_NAME/.git" ]; then
  echo "Repository $REPO_NAME already exists, skipping clone."
else
  git clone "$REPO_URL"
  echo "Repository cloned successfully."
fi

# Navigate into the newly cloned repository directory to build the structure inside it
cd "$REPO_NAME"

echo "Starting project structure setup inside $LAB_ROOT_DIR/$REPO_NAME"

########################################
# LOG ANALYZER PROJECT
########################################
echo "Setting up Log Analyzer project structure..."
mkdir -p log-analyzer/{scripts,tests}
touch log-analyzer/{log_analyzer.sh,log_analyzer.py,README.md}
chmod +x log-analyzer/log_analyzer.sh

########################################
# BACKUP TOOL PROJECT
########################################
echo "Setting up Backup Tool project structure..."
mkdir -p backup-tool/{scripts,config}
touch backup-tool/{backup.sh,backup.py,README.md}
touch backup-tool/config/example.conf
chmod +x backup-tool/backup.sh

########################################
# SYSTEM MONITOR PROJECT
########################################
echo "Setting up System Monitor project structure..."
mkdir -p system-monitor/{scripts,systemd}
touch system-monitor/{monitor.sh,system_monitor.py,README.md}
touch system-monitor/systemd/system_monitor.service
chmod +x system-monitor/monitor.sh

########################################
# ANSIBLE PLAYBOOKS
########################################
echo "Setting up Ansible Playbooks structure..."
mkdir -p ansible-playbooks
cd ansible-playbooks

# basic Ansible structure
mkdir -p inventory group_vars host_vars roles site-playbooks

# example inventory file
touch inventory/hosts.ini

# example group_vars/host_vars
mkdir -p group_vars/all host_vars/example-host
touch group_vars/all/main.yml
touch host_vars/example-host/main.yml

# roles skeleton
mkdir -p roles/{common,web,db}/{tasks,handlers,templates,files,vars,defaults,meta}
touch roles/common/tasks/main.yml
touch roles/web/tasks/main.yml
touch roles/db/tasks/main.yml

# main site playbook
touch site-playbooks/site.yml

# Go back up to the root of the repo directory (~/devops-lab/devops-lab)
cd ..

########################################
# DOCKER PROJECTS
########################################
echo "Setting up Docker Projects structure..."
mkdir -p docker-projects/{python-app,nginx-test}
touch docker-projects/python-app/{Dockerfile,app.py,README.md}
touch docker-projects/nginx-test/{Dockerfile,README.md}

########################################
# TOP-LEVEL README (for the whole lab)
########################################

# Only create README if it doesn't exist yet
if [ ! -f README.md ]; then
  touch README.md
fi

echo "DevOps Lab setup complete!"
