FROM alpine:latest

# Installing phase
RUN apk update
RUN apk add openssl
RUN apk add nginx

RUN adduser -D -g 'www' www

RUN mkdir -p /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir -p /run/nginx

# Config file and webpage
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www/index.html

# SSL manager

RUN adduser -D user
RUN echo "user:password" | chpasswd
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/ft_services.key -out /etc/ssl/certs/ft_services.crt

#COPY start.sh ./start.sh
#RUN chmod +x /start.sh
#CMD sh ./start.sh
#RUN nginx -g 'daemon off;'
EXPOSE 80
EXPOSE 443
EXPOSE 22