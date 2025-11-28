FROM php:8.2-apache

# Copia tu proyecto al contenedor
COPY . /var/www/html/

# Instala extensiones necesarias
RUN docker-php-ext-install mysqli pdo pdo_mysql

EXPOSE 80
