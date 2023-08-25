FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y redis-server

COPY ./tools/config.sh config.sh

CMD ["redis-cli"]