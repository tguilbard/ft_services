FROM alpine:latest

RUN apk update \
&& apk add vsftpd && apk add openssl

ADD ./vsftpd.conf		./etc/vsftpd/vsftpd.conf
ADD ./setup.sh		./srcs/setup.sh
RUN chmod +x ./srcs/setup.sh

RUN openssl req -x509 -nodes -subj '/C=FR/ST=PARIS/L=PARIS/O=jereligi/CN=localhost' \
		-days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key \
		 -out /etc/ssl/certs/vsftpd.crt

EXPOSE 21 21000-21010

CMD ["sh", "/srcs/setup.sh"]