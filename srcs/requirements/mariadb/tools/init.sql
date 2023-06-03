CREATE DATABASE IF NOT EXISTS database_here;
CREATE USER IF NOT EXISTS 'username_here'@'%' IDENTIFIED BY 'password_here';
GRANT ALL PRIVILEGES ON database_here.* TO 'username_here'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root_pw_here';
use database_here;
