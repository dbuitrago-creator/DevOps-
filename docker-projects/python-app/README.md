# DevOps Lab – Python Healthcheck Web App

## Overview

This project is a lightweight Python HTTP healthcheck service built as part of my DevOps lab environment.  
It is designed to practice and demonstrate:

- Docker containerization
- Ansible-based multi-node deployments
- Linux service automation
- Infrastructure health validation
- Cross-distro operations (Ubuntu + Rocky Linux)

The application provides a simple HTTP endpoint that returns runtime system information, making it ideal for testing DevOps automation pipelines and service monitoring workflows.

---

## Features

- Pure Python (standard library only, no external dependencies)
- Simple HTTP server with healthcheck endpoint
- Returns hostname, request path, and status
- Configurable listening port via environment variable
- Container-ready with minimal Dockerfile
- Suitable for automated deployment via Ansible

---

## Application Endpoints

| Path       | Description                         |
|------------|-------------------------------------|
| `/`        | Returns service health response     |
| `/health` | Returns service health response     |
| Other     | Returns 404 Not Found               |

---

## Sample Response

DevOps Lab Python App  
Host: devops-lab-node  
Path: /health  
Status: OK

---

## Run Locally (No Docker)

```bash
python3 app.py
