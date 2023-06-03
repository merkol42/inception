#!/bin/sh

service mysql start;

#putting the user and password from the .env into the config
sed -i 's/username_here/'$DB_USER'/g' init.sql && \
sed -i 's/password_here/'$DB_PASSWORD'/g' init.sql && \
sed -i 's/root_pw_here/'$DB_ROOT_PASSWORD'/g' init.sql && \
sed -i 's/database_here/'$DB_NAME'/g' init.sql

sed 's/skip-networking/#skip-networking/g' -i  /etc/mysql/mariadb.conf.d/50-server.cnf

cat init.sql

#starting the mysql and giving it the init as input
mysql < init.sql
# rm -f init.sql;
mysqladmin -u root -p${DB_ROOT_PASSWORD} shutdown;
rm -f init.sql;
# mysqld;
