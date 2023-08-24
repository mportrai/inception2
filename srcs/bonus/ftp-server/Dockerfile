FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/config.sh config.sh

CMD ["bash", "config.sh"]