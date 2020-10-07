FROM alpine:latest

RUN apk add openrc influxdb \
&& apk add ca-certificates
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/telegraf.conf

COPY setup.sh /setup.sh
RUN chmod +x /setup.sh
EXPOSE 8086
CMD ./setup.sh