FROM debian:stable-slim

RUN apt-get update -y && apt-get install -y \
	nginx \
 	openssl \
	curl 

COPY conf/default /etc/nginx/sites-available/default

COPY tools/docker-entrypoint.sh /usr/local/bin/.
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT [ "docker-entrypoint.sh" ]

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]