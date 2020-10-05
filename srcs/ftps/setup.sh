echo -e "password\npassword" | adduser -h ftp/root -s /sbin/nologin root
mkdir -p ftp/root
chown root:root ftp/root

exec /usr/sbin/vsftpd -opasv_min_port=21000 -opasv_max_port=21000 -opasv_address=192.168.99.127 /etc/vsftpd/vsftpd.conf