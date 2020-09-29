FROM alpine:latest

RUN apk update \
&& apk add mariadb mariadb-client openrc

ADD setup.sh /srcs/setup.sh
RUN chmod +x /srcs/setup.sh

EXPOSE 3306

CMD ["sh", "/srcs/setup.sh"]