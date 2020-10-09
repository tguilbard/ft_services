yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem 

adduser -D "admin"
echo "admin:password" | chpasswd

openrc
touch /run/openrc/softlevel
rc-update add telegraf

telegraf &
pure-ftpd -j -Y 2 -p 21000:21000 -P 172.17.0.2