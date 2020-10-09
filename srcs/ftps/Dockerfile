FROM alpine:latest

RUN apk update \
&& apk add vsftpd && apk add openssl openrc --no-cache
RUN apk add telegraf pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

ADD setup.sh /srcs/setup.sh
ADD telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 21 21000

CMD ["sh", "/srcs/setup.sh"]