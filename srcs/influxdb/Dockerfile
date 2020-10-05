FROM alpine:latest

RUN apk add openrc influxdb

ADD setup.sh /srcs/setup.sh

EXPOSE 8086

CMD ["sh", "/srcs/setup.sh"]