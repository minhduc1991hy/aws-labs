#!/bin/bash
sudo su
yum update -y
amazon-linux-extras install nginx1 -y

# Install PHP 8.1
amazon-linux-extras enable php8.1
yum clean metadata
yum install php php-cli php-mysqlnd php-pdo php-common php-fpm -y
yum install php-gd php-mbstring php-xml php-dom php-intl php-simplexml -y
systemctl enable php-fpm
service php-fpm start


systemctl enable nginx
# Move web site configure file to /etc/nginx/conf.d/
cp /home/ec2-user/sites.conf /etc/nginx/conf.d/

# Move phpsite to /var/www/ to advoid forbidden error 403
mv /home/ec2-user/html /var/www/

# Start Nginx
service nginx start