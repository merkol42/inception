FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y openssl nginx

# making a new ssl key
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 30 -nodes \
    -out /etc/ssl/merkol.42.fr.pem \
    -keyout /etc/ssl/merkol.42.fr.key -subj "/C=TR/ST=KOCAELI/L=IZMIT/O=42 School/OU=merkol/CN=merkol.42.fr"

RUN rm -f /etc/nginx/sites-available/default && rm -f /etc/nginx/sites-enabled/default

COPY conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf

# RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

#the command run when this container starts
CMD ["nginx", "-g", "daemon off;"]

# req: Sertifika isteği oluşturur.
# -x509: Sertifika formatı. web güvenli iletişim için dijital standarttır.
# -nodes: Sertifika için şifre kullanılmayacağını belirtir.
# rsa:4096: 4096 bitlik bir rsa anahtarı oluşturur.