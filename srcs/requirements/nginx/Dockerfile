FROM	debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get install -y nginx
RUN apt-get clean

RUN mkdir -p /etc/nginx/ssl
RUN apt-get install -y openssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=mportrai.42.fr/UID=mportrai" ;
RUN mkdir -p /var/run/nginx

COPY    conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod -R 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD ["nginx", "-g", "daemon off;"]