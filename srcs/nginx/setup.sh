#!/bin/sh

openrc
touch /run/openrc/softlevel
service nginx start
adduser -D user42
echo "user42:user42" | chpasswd
rc-update add sshd
rc-status
/etc/init.d/sshd start

tail -f /dev/null