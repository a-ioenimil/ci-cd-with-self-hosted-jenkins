#!/bin/bash
set -e

# Set non-interactive frontend for apt-get
export DEBIAN_FRONTEND=noninteractive

# 1. System Updates & Hardening
apt-get update
# Install debconf-utils for non-interactive configuration
apt-get install -y debconf-utils unattended-upgrades fail2ban curl unzip

# Enable automatic security updates non-interactively
echo "unattended-upgrades unattended-upgrades/enable_auto_updates boolean true" | debconf-set-selections
dpkg-reconfigure -f noninteractive unattended-upgrades

# 2. Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
usermod -aG docker ubuntu

# 3. Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

# 4. Run Jenkins Container

docker volume create jenkins_home

docker run -d \
  --name jenkins \
  --restart always \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins:lts-jdk17

