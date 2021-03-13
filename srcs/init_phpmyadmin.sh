printf "\n${GREEN}%50s%23s${RESET}\n\n" " INITIALIZING PHPMYADMIN " |tr " " "="

cd /var/www
mkdir localhost && cd localhost
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
mv phpMyAdmin-5.0.1-english phpmyadmin
cp /tmp/srcs/config.inc.php /var/www/localhost/phpmyadmin/