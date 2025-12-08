#!/bin/bash

set -e

mkdir -p /etc/nginx/ssl

if [ ! -f /etc/nginx/ssl/inception.key ]; then
	openssl genrsa -out /etc/nginx/ssl/inception.key 2048
	openssl req -new -x509 -nodes -key /etc/nginx/ssl/inception.key \
		-out /etc/nginx/ssl/inception.crt -days 100 \
		-subj "/C=MA/ST=Casablanca/L=Casablanca/O=42/CN=${DOMAIN_NAME}"
fi

exec "$@"