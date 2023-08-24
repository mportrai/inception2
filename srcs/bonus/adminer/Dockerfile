FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y apache2-utils
RUN apt-get install -y php
RUN apt-get install -y php-curl

WORKDIR /var/www/html
RUN mkdir adminer
RUN curl -L https://www.adminer.org/latest.php -o adminer/index.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "adminer"]