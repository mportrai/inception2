FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y vim
RUN apt-get install -y apt-utils
RUN apt-get install -y wget
RUN apt-get install -y php7.4
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y mariadb-client
RUN apt-get install -y redis
RUN apt-get install -y php-redis

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php/7.4/fpm
RUN chown -R www-data:www-data /run/php/7.4/fpm
RUN chmod -R 755 /var/www/*
RUN chown -R www-data:www-data /var/www/*


WORKDIR /var/www/html
COPY tools/config.sh /usr/local/bin/config.sh
RUN chmod +x /usr/local/bin/config.sh

ENTRYPOINT [ "/usr/local/bin/config.sh" ]