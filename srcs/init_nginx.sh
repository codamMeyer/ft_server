printf "\n${GREEN}%50s%23s${RESET}\n\n" " INITIALIZING NGINX " |tr " " "="

cp /tmp/srcs/nginx_conf /etc/nginx/sites-available/default
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl_key.key -out /etc/ssl/certs/ssl_key.crt -subj "/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/CN=localhost"
