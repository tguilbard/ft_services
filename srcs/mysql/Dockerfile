FROM alpine:latest

RUN apk update && apk add --no-cache --upgrade bash \
&& apk add mariadb mariadb-client openrc
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mysql --version

ADD setup.sh .
ADD init.sh .
ADD wordpress.sql .
RUN chmod +x setup.sh
RUN chmod +x init.sh

RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 3306

CMD ["sh", "init.sh"]