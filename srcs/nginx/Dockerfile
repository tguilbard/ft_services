FROM alpine:latest

# Install nginx and its dependencies
RUN apk update && apk add openrc \
&& apk add openssl openssh nginx

# We create user that the web server will use
RUN adduser -D -g 'www' www

# We setup web server files and permissions
RUN mkdir -p /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx

# Nginnx config
RUN rm /etc/nginx/nginx.conf
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./index.html /www/index.html

# Create the file with the ssl key inside
RUN mkdir -p /etc/nginx/ssl && openssl req -newkey rsa:2048 -x509 -days 365 -nodes -keyout /etc/nginx/ssl/ft_services.key -out /etc/nginx/ssl/ft_services.pem -subj "/C=FR/ST=Paris/L=Paris/O=42, Inc./OU=IT/CN=ft_services"

RUN	usr/bin/ssh-keygen -A
COPY	sshd_config /etc/ssh/

# We customize the SSH welcome message
RUN echo 'Welcome' > /etc/motd


COPY setup.sh ./setup.sh
RUN chmod +x ./setup.sh
CMD ./setup.sh

EXPOSE 80 443 22