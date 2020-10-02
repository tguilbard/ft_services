#! /bin/bash

# Wait that mysql was up
until mysql
do
	echo "NO_UP"
done

# Init DB
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'root'@'%' IDENTIFIED BY 'password';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "ALTER USER 'root'@'%' IDENTIFIED BY 'password';" | mysql -u root --skip-password
echo "DROP DATABASE test" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
cat wordpress.sql | mysql wordpress -u root --skip-password