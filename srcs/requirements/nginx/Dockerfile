FROM debian:buster

ARG DOMAIN_NAME

#-y flag for assume yes to update and upgrade stuff
RUN apt-get update && apt-get upgrade -y

#install nginx and other usefull applications
RUN apt-get install -y openssl nginx

#making a dir for storing the ssl keys and cert
RUN mkdir -p /var/ssl

# making a new ssl key
RUN openssl req -x509 -newkey rsa:2048 -nodes \
    -out /var/ssl/nginx_server.crt \
    -keyout /var/ssl/nginx_server.key -subj "/C=/ST=/L=/O=/CN=${DOMAIN_NAME}"

#removing the default config
RUN rm -f /etc/nginx/sites-available/default && rm -f /etc/nginx/sites-enabled/default

#copy the config for nginx from the local directory to the directory in the image
COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

#the command run when this container starts
CMD ["nginx", "-g", "daemon off;"]
