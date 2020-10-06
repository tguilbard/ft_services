FROM alpine:latest

RUN apk add openrc influxdb \
&& apk add ca-certificates

EXPOSE 8086

CMD influxd run -config /etc/influxdb.conf