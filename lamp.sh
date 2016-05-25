#!/usr/bin/env bash

# development environment
ENV='LAMP'

# packages to install
PACKAGES=('apache2' 'php5' 'mysql-server' 'phpmyadmin' 'git')

# default mysql/phpmyadmin password for root
PASSWORD='password'

# databases array, uncomment the line below and add your databases
# DBA=('DB1' 'DB2')

# set mysql and phpmyadmin passwords
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"

sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password $PASSWORD"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"

# update packages repository
echo -e "\e[34;1mUpdating packages repository\e[0m"
sudo apt-get -y update

# install packages
for  i in "${PACKAGES[@]}"; do
    echo -e "\e[34;1mInstalling $i\e[0m"
    sudo apt-get install -y $i
done

# set symlink
if ! [ -L /var/www/html ]; then
  rm -rf /var/www/html
  ln -fs /vagrant /var/www/html
fi

# fix phpmyadmin mcrypt bug
sudo php5enmod mcrypt

# enable mod_rewrite
sudo a2enmod rewrite

# enable display of php errors
sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php5/apache2/php.ini

# restart apache
service apache2 restart

# install Composer
echo -e "\e[34;1mInstalling Composer\e[0m"
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# check if DBA array is set and not empty
if [ -z ${DBA+x} ]; then
    echo -e "\e[33;1mNo Databases to create or import.\e[0m"
else
    # create databases from DBA array
    echo -e "\e[34;1m--Creating Databases--\e[0m"
    for  i in "${DBA[@]}"; do
        echo -e "\e[34;1mCreating $i database.\e[0m"
        mysql -uroot -p$PASSWORD -e "create database $i"
        # import sql file from `sqldump` folder
        if [ ! -f /vagrant/sqldump/$i.sql ]; then
            echo -e "\e[33;1mNo $i.sql file to import.\e[0m"
        else
            echo -e "\e[34;1mImporting $i.sql\e[0m"
            mysql -uroot -p$PASSWORD $i < /vagrant/sqldump/$i.sql
        fi
    done
fi

# remove trailing \r error in backup.sh
sed -i 's/\r$//' /vagrant/sqldump/backup.sh

# notify script completion
echo -e "\e[34;1m$ENV environment is up and running...\e[0m\007"
