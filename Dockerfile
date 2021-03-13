FROM debian:buster

ENV RESET='\e[0m'
ENV GREEN='\e[1;32m'
ENV DB_NAME='wp_database'
ENV DB_USERNAME='db_admin'
ENV DB_PASSWORD='db123'
ENV WP_ADMIN='wp_admin'
ENV WP_EMAIL='mmeyer@student.codam.nl'
ENV WP_PASSWORD='wp123'
ENV WP_PATH='/var/www/localhost/wordpress'

COPY ./srcs/* /tmp/srcs/
RUN bash /tmp/srcs/install_dependencies.sh
RUN bash /tmp/srcs/init_database.sh
RUN bash /tmp/srcs/init_nginx.sh
RUN bash /tmp/srcs/init_phpmyadmin.sh
RUN bash /tmp/srcs/init_wordpress.sh

RUN chmod -R 755 /var/www/localhost/* && chown -R www-data:www-data /var/www/localhost/*

CMD bash /tmp/srcs/start_services.sh