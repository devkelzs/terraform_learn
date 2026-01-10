#!/bin/bash
set -eux

# Update package list
apt-get update -y

# Install nginx
apt-get install -y nginx

# Start and enable nginx
systemctl start nginx
systemctl enable nginx

# Create a simple webpage
echo "<h1>Terraform Project 1 - Dev Environment</h1>" > /var/www/html/index.html
