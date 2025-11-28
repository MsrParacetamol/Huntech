FROM php:8.2-apache

# Instala MariaDB y extensiones necesarias de PHP
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client && \
    docker-php-ext-install mysqli pdo pdo_mysql

# Copia tu proyecto
COPY . /var/www/html/

# Copia tu SQL de inicialización
COPY huntechdb.sql /docker-entrypoint-initdb.d/

# Arranca MariaDB con tu script y Apache
CMD mysqld_safe --init-file=/docker-entrypoint-initdb.d/huntechdb.sql & apache2-foreground

EXPOSE 80
