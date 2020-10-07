set -x
mkdir -p /srcs/ftp/$USER
echo -e "$PASSWORD\n$PASSWORD" | adduser -h /srcs/ftp/$USER $USER
chown $USER:$USER /srcs/ftp/$USER
telegraf &

exec /usr/sbin/vsftpd -opasv_min_port=21000 -opasv_max_port=21010 -opasv_address=192.168.99.127 /etc/vsftpd/vsftpd.conf