# Inception

Inception is a Docker-based infrastructure project that deploys a complete WordPress environment using multiple isolated containers. The goal is to demonstrate how a web application can be split into separate services while still working as one functional system.

## Architecture

The project is built around three main components:

- NGINX: the public entry point, serving the site over HTTPS
- WordPress: the application layer running PHP-FPM
- MariaDB: the database backend used by WordPress

Each service runs in its own container and communicates through a custom Docker network. Persistent volumes are used to keep the WordPress files and database data available across container restarts.

## Project purpose

This project focuses on container orchestration and system design. It shows how to build a modular web stack with clear separation between the front-end, application, and database layers, while maintaining security, persistence, and reliability.

## Key concepts

- service isolation through containers
- inter-service communication via Docker networking
- HTTPS termination with NGINX
- persistent storage for application and database data
- automated service initialization using container entrypoints
- environment-based configuration for deployment settings

## Structure

```text
.
├── Makefile
├── README.md
└── srcs
    ├── docker-compose.yml
    └── requirements
        ├── mariadb
        ├── nginx
        └── wordpress
```

## Summary

Inception is a multi-container web platform built around NGINX, WordPress, and MariaDB. It is a practical exercise in building a complete, production-inspired architecture using Docker, networking, TLS, and persistent storage.
