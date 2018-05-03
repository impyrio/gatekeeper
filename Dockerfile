#
# Impyrio Public Dockerfile
#
FROM alpine:3.7
LABEL author="Patrick Kohler"

RUN apk add --no-cache nginx jq

# Delete default config
RUN rm -r /etc/nginx/conf.d && rm /etc/nginx/nginx.conf

# Create folder for PID file
RUN mkdir -p /run/nginx

# Add our nginx conf
COPY nginx.conf /etc/nginx/nginx.conf

#COPY ./www/maintenance.html /www/maintenance.html

# Add volume for extra configuration files
VOLUME [ "/etc/conf" ]

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]