printf "\n${GREEN}%50s%23s${RESET}\n\n" " INITIALIZING DATABASE " |tr " " "="

service mysql start

echo "CREATE DATABASE ${DB_NAME};" | mysql -u root
echo "CREATE USER ${DB_USERNAME}@localhost IDENTIFIED BY '${DB_PASSWORD}';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_USERNAME}@localhost;" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;"| mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
echo "update mysql.user set plugin='' where user='root';"| mysql -u root
