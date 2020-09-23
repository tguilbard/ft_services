FROM alpine:latest

RUN apk update && apk add nginx

RUN mkdir -p /www
COPY index.html /www

RUN mkdir -p /ect/ssl
COPY mkcert .
RUN chmod +x mkcert && ./mkcert -install && ./mkcert ft_services \
&& cp ./ft_services.pem /ect/ssl/ft_services.pem \
&& cp ./ft_services-key.pem /ect/ssl/ft_services-key.pem

RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443