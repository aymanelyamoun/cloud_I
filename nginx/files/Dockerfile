FROM nginx:stable-alpine

# Install OpenSSL and bash (Alpine uses apk)
RUN apk add --no-cache openssl bash

# Copy config and setup scripts
COPY assets /assets

# Make scripts executable and run them
RUN chmod +x /assets/*.sh && /assets/set_up_ssl_cert.sh && /assets/nginx_setup.sh

# Expose HTTP and HTTPS
EXPOSE 80 443

# Start Nginx
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
