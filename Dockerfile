FROM php:8.2-apache

# Instala MySQL Server y extensiones necesarias
RUN apt-get update && \
    apt-get install -y default-mysql-server && \
    docker-php-ext-install mysqli pdo pdo_mysql

# Copia tu proyecto
COPY . /var/www/html/

# Inicia MySQL al arrancar el contenedor
CMD service mysql start && apache2-foreground

EXPOSE 80
