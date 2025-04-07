FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    bash \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

COPY assets /assets

RUN chmod +x /assets/*.sh \
 && /assets/set_up_ssl_cert.sh \
 && /assets/nginx_setup.sh

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

# FROM alpine:latest

# RUN apk update
# RUN apk add nginx

# COPY assets assets

# RUN chmod +x assets/nginx_setup.sh
# RUN assets/nginx_setup.sh
# RUN chmod +x assets/set_up_ssl_cert.sh
# RUN apk add openssl

# RUN assets/set_up_ssl_cert.sh
# CMD ["nginx", "-g", "daemon off;"]
