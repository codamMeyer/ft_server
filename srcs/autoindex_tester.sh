printf "\n${GREEN}%50s%23s${RESET}\n\n" " AUTOINDEX TESTER " |tr " " "="

cd /var/www/localhost
mkdir hello
cd hello

for i in {0..5}
do
    echo "This could be a problem" > "file_${i}.txt"
done

chmod -R 755 /var/www/localhost/* && chown -R www-data:www-data /var/www/localhost/*

chmod 777 /etc/nginx/sites-available/default

if [[ $1 = off ]]
then
    sed -i 's/autoindex on/autoindex off/' /etc/nginx/sites-available/default
fi

if [[ $1 = on ]]
then
    sed -i 's/autoindex off/autoindex on/' /etc/nginx/sites-available/default
fi

service nginx restart