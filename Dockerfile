FROM php:8.2-apache

# Instala MariaDB y extensiones necesarias de PHP
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client && \
    docker-php-ext-install mysqli pdo pdo_mysql

# Copia tu proyecto al contenedor
COPY . /var/www/html/

# Copia tu dump SQL para inicializar la base de datos
COPY huntechdb.sql /docker-entrypoint-initdb.d/

# Arranca MariaDB y Apache juntos
CMD mysqld_safe & apache2-foreground

EXPOSE 80
