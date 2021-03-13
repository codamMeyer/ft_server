printf "\n${GREEN}%50s%23s${RESET}\n\n" " INITIALIZING WORDPRESS " |tr " " "="

cd /var/www/localhost
wget http://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz && rm latest.tar.gz
ln -s wordpress/index.php .

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

service mysql start

wp config create --path=$WP_PATH --dbname=$DB_NAME --dbuser=root --allow-root
wp core install --title="My FT_SERVER " --admin_name="${WP_ADMIN}" --admin_password="${WP_PASSWORD}" --admin_email="${WP_EMAIL}" --path=$WP_PATH --url="https://localhost/wordpress" --allow-root 
wp option update blogdescription "just another 42 project" --allow-root --path=$WP_PATH
wp theme activate twentytwenty --allow-root --path=$WP_PATH
wp menu create "My project" --allow-root --path=$WP_PATH
wp menu location assign "My project" primary --allow-root --path=$WP_PATH
wp menu item add-custom "My project" "Wordpress admin" http://localhost/wordpress/wp-admin --allow-root --path=$WP_PATH
wp menu item add-custom "My project" "PhpMyAdmin" http://localhost/phpmyadmin --allow-root --path=$WP_PATH
wp post update 1 --post_content="This is my ft_server project!" --post_title="Hello { FT_SERVER } world" --allow-root --path=$WP_PATH