#!/bin/sh

openrc
touch /run/openrc/softlevel
service nginx start
echo -e "$SSH_PASSWORD\n$SSH_PASSWORD" | adduser $SSH_USER
rc-update add sshd
rc-status
/etc/init.d/sshd start

tail -f /dev/null