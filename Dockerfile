FROM php:8.2-apache

# Instala MySQL Server y extensiones necesarias
RUN apt-get update && \
    apt-get install -y default-mysql-server && \
    docker-php-ext-install mysqli pdo pdo_mysql

# Copia tu proyecto al contenedor
COPY . /var/www/html/

# Copia tu dump SQL para inicializar la base
COPY huntechdb.sql /docker-entrypoint-initdb.d/

# Inicia MySQL y Apache al arrancar el contenedor
CMD service mysql start && apache2-foreground

EXPOSE 80
