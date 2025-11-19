#!/bin/bash
set -eux

apt-get update -y
apt-get install -y nginx unzip

systemctl enable --now nginx

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip /tmp/awscliv2.zip -d /tmp
/tmp/aws/install

echo "Instância Base com NGINX + AWS CLI" > /var/www/html/index.html
