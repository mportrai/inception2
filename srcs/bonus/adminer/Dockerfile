FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y php \
                    php-common \
                    php-pear \
                    php-mbstring \
                    libapache2-mod-php \
                    php-mysql

RUN apt -y install apache2 wget
RUN systemctl enable --now wget

WORKDIR /var/www/html
RUN mkdir adminer
RUN curl -L https://www.adminer.org/latest.php -o adminer/index.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "adminer"]