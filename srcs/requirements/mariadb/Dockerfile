FROM debian:buster

ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_ROOT_PASSWORD

#-y flag for assume yes to update and upgrade stuff
RUN apt-get update && apt-get upgrade -y

#install mariadb and other usefull applications
RUN apt-get install -y mariadb-server mariadb-client

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/ .

RUN sh db.sh

CMD ["mysqld"]
