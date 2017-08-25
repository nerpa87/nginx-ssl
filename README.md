## Sample nginx with self-signed certs ##

### build ###
docker build -t nginx_ssl .

### run ###
sudo docker run -p 443:443 -d nginx_ssl
