FROM debian:stable-slim

RUN apt-get update && \
	apt-get install -y mariadb-server

COPY tools/docker-entrypoint.sh /usr/local/bin/.
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT [ "docker-entrypoint.sh" ]

EXPOSE 3306

CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]