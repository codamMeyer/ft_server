printf "\n${GREEN}%50s%23s${RESET}\n\n" "INSTALLING-ALL-DEPENDENCIES" |tr " " "="

apt-get update
apt-get -y install upgrade
apt-get -y install apt-utils
apt-get -y install procps
apt-get -y install wget
apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
apt-get -y install nginx
apt-get -y install mariadb-server