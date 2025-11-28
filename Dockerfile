FROM php:8.2-apache

# Instala MariaDB y extensiones PHP
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client && \
    docker-php-ext-install mysqli pdo pdo_mysql

# Copia tu proyecto
COPY . /var/www/html/

# Inicializa la base de datos
RUN service mysql start && \
    mysql -e "CREATE DATABASE IF NOT EXISTS huntechdb;"

# Arranca Apache (MariaDB se queda corriendo en background)
CMD mysqld_safe & apache2-foreground

EXPOSE 80
