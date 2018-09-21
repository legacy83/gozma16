#!/usr/bin/env bash

#== Variables ==
#== Functionality ==

webserver_install() {
  apt-get install -y \
    apache2 php7.0 \
    libapache2-mod-php7.0 \
    php7.0-cli php7.0-common php7.0-dev \
    php7.0-pgsql php7.0-sqlite3 php7.0-gd \
    php7.0-curl php7.0-imap php7.0-mysql php7.0-mbstring \
    php7.0-xml php7.0-zip php7.0-bcmath php7.0-soap \
    php7.0-intl php7.0-readline php7.0-opcache \
    php7.0-xmlrpc php7.0-xsl php7.0-json \
    php7.0-bz2 php7.0-mcrypt php-imagick \
    php-pear php-memcached php-apcu
}

webserver_setup() {
  local DOMAIN='gozma16.local'

  echo "<VirtualHost *:80>
    ServerName ${DOMAIN}
    DocumentRoot /var/www/html
    AllowEncodedSlashes On
    <Directory /var/www/html>
      Options +Indexes +FollowSymLinks
    	DirectoryIndex index.php index.html
    	Order allow,deny
    	Allow from all
    	AllowOverride All
    </Directory>
    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
  </VirtualHost>" > /etc/apache2/sites-available/000-default.conf

  sed -i "s/memory_limit = .*/memory_limit = 256M/" /etc/php/7.0/apache2/php.ini
  sed -i "s/post_max_size = .*/post_max_size = 64M/" /etc/php/7.0/apache2/php.ini
  sed -i "s/upload_max_filesize = .*/upload_max_filesize = 32M/" /etc/php/7.0/apache2/php.ini

  a2enmod expires
  a2enmod headers
  a2enmod include
  a2enmod rewrite
}

webserver_ownership() {
  sed -ri 's/^(export APACHE_RUN_USER=)(.*)$/\1vagrant/' /etc/apache2/envvars
  sed -ri 's/^(export APACHE_RUN_GROUP=)(.*)$/\1vagrant/' /etc/apache2/envvars

  chown -R vagrant:vagrant /var/lock/apache2
  chown -R vagrant:vagrant /var/log/apache2
  chown -R vagrant:vagrant /var/www
}

#== Provisioning Script ==

export DEBIAN_FRONTEND=noninteractive

webserver_install
webserver_setup
webserver_ownership

# Restart service
service apache2 restart
