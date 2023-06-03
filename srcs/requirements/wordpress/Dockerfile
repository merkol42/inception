FROM debian:buster

RUN apt-get update && \
    apt-get install -y curl php-fpm php-mysql mariadb-client

COPY tools/config.sh .

RUN chmod 755 /config.sh

WORKDIR /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

CMD /config.sh && exec /usr/sbin/php-fpm7.3 -F
