FROM ubuntu:14.04

RUN apt-get update && apt-get install -y wget nginx
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN apt-get install -y nodejs

RUN mkdir -p /etc/ssl/certs
RUN mkdir -p /etc/ssl/private
RUN mkdir -p /var/www/html/static

ADD myssl.crt /etc/ssl/certs/myssl.crt
ADD myssl.key /etc/ssl/private/myssl.key

ADD nginx.conf /etc/nginx/sites-available/default
RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

ADD static/tKsDb.png /var/www/html/static/tKsDb.png
ADD static/index.html /var/www/html/static/index.html

ADD server.js /var/www/html/server.js

WORKDIR /var/www/html

EXPOSE 443 

CMD service nginx start && node server.js
