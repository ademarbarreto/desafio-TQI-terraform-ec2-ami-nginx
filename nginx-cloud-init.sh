#!/bin/bash
set -e


# Update & install nginx
apt-get update -y
apt-get install -y nginx


# Start nginx
systemctl enable nginx
systemctl start nginx


# Put a simple index to identify this instance
echo "<h1>NGINX served from $(hostname)</h1>" > /var/www/html/index.html