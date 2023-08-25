FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y

COPY static.html /var/www/html/static.html

RUN chmod 755 /var/www/html/*
RUN chown -R www-data:www-data /var/www/html/*

WORkDIR /var/www/html