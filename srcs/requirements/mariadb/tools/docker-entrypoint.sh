#!/bin/bash
set -e

mkdir -p /run/mysqld
chown mysql:mysql /run/mysqld

echo "========>>starting MariaDB setup...<<========"
if [ ! -d /var/lib/mysql/mysql ]; then
	echo ">>>>>>>>>Initializing database...<<<<<<<<<"
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi


echo ">>>>>>>prepering SQL setup file...<<<<<<<<"
cat > /tmp/create_db.sql <<-EOSQL
	USE mysql;
	FLUSH PRIVILEGES;
	SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MYSQL_ROOT_PASSWORD}');
	CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;
	CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';
	CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
	GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'localhost';
	GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO '${MYSQL_USER}'@'%';
	FLUSH PRIVILEGES;
EOSQL


echo ">>>> running bootstrap SQL setup <<<<"
mariadbd --user=mysql --bootstrap < /tmp/create_db.sql


echo "************** setup completed *************"
exec "$@"

