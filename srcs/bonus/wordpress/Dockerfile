FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget
RUN apt-get install -y php7.4
RUN apt-get install -y php-fpm
RUN apt-get install -y php-mysql
RUN apt-get install -y mariadb-client
RUN apt-get install -y redis
RUN apt-get install -y php-redis

RUN wget https://fr.wordpress.org/wordpress-6.2.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.2.2-fr_FR.tar.gz && rm -rf wordpress-6.2.2-fr_FR.tar.gz
COPY conf/wp-config.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN chmod 755 /var/www/html/wordpress
RUN chown -R root:root /var/www/html/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/config.sh config.sh

ENTRYPOINT ["bash", "config.sh"]