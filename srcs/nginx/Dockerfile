FROM alpine:latest

RUN apk update && apk add openrc \
&& apk add nginx openssl openssh

ADD nginx.conf /etc/nginx/nginx.conf
ADD setup.sh setup.sh
RUN chmod +x setup.sh
RUN mkdir www
ADD index.html /www/index.html
ADD wallpaper.png /www/wallpaper.png

RUN openssl req -x509 -nodes -subj '/C=FR/ST=PARIS/L=PARIS/O=42/CN=localhost' \
		 -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
		 -out /etc/ssl/certs/nginx-selfsigned.crt

ADD sshd_config /etc/ssh/

EXPOSE 22 80 443

CMD ["sh", "./setup.sh"]