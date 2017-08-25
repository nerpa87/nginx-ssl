FROM ubuntu:14.04

RUN apt-get update && apt-get install -y wget nginx
RUN mkdir -p /etc/ssl/certs
RUN mkdir -p /etc/ssl/private
RUN mkdir -p /var/www/html

ADD index.html /var/www/html/index.html

ADD myssl.crt /etc/ssl/certs/myssl.crt
ADD myssl.key /etc/ssl/private/myssl.key

ADD nginx.conf /etc/nginx/sites-available/default
RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

ADD tKsDb.png /var/www/html/tKsDb.png

EXPOSE 443 

CMD ["nginx", "-g", "daemon off;"]
