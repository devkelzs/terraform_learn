#!/bin/bash

set -e

exec > >(tee /var/log/user_data.log) 2>&1

echo "====== User Data Script Started ======"

# Update system
apt-get update -y
apt-get upgrade -y

# Install base packages
apt-get install -y nginx unzip curl

# Install AWS CLI v2
echo "Installing AWS CLI v2..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

# Verify AWS CLI
aws --version

# Start and enable nginx
systemctl start nginx
systemctl enable nginx

# Clean web root
rm -rf /var/www/html/*

# Sync website from S3
aws s3 sync s3://tf-website-content /var/www/html

# Fix permissions
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html

# Restart nginx
systemctl restart nginx

echo "====== User Data Script Completed ======"
