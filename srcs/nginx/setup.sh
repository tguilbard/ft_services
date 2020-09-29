# Nginx start
openrc
touch /run/openrc/softlevel
service nginx start
echo -e "user42\nuser42" | adduser user42
rc-update add sshd
rc-status
/etc/init.d/sshd start

tail -f /dev/null # Freeze command to avoid end of container