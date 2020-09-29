# Comment line start with 'skip-networking'
mv /etc/my.cnf.d/mariadb-server.cnf /etc/my.cnf.d/old_mariadb-server.cnf
sed 's/^skip-networking/#&/' /etc/my.cnf.d/old_mariadb-server.cnf > /etc/my.cnf.d/mariadb-server.cnf
rm /etc/my.cnf.d/old_mariadb-server.cnf

# Config Openrc and start Mariadb
openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
rc-service mariadb start

Create Database wordpress
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'wp_admin'@'%' IDENTIFIED BY 'password';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_admin'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "ALTER USER 'wp_admin'@'%' IDENTIFIED BY 'password';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password