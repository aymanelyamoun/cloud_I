mkdir /etc/nginx/ssl
openssl req -x509 -sha256 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt -days 365 -subj "/C=US/ST=fakestate/L=FakeCity/O=fakeOrganization/OU=fakeDepartment/CN=ael-yamo.42.fr"

