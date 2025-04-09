FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    bash \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

COPY assets /assets
COPY default.conf /etc/nginx/sites-available/default

RUN chmod +x /assets/*.sh \
 && /assets/set_up_ssl_cert.sh \
 && /assets/nginx_setup.sh

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

