FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y mariadb-server
RUN rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/run/mysqld
RUN chmod 755 /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/config.sh /usr/local/bin/config.sh
RUN chmod +x /usr/local/bin/config.sh

ENTRYPOINT [ "/usr/local/bin/config.sh" ]