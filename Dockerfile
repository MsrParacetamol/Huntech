FROM php:8.2-apache

# Instala MariaDB y extensiones necesarias de PHP
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client && \
    docker-php-ext-install mysqli pdo pdo_mysql

# Copia tu proyecto al contenedor
COPY . /var/www/html/

# Copia tu dump SQL para inicializar la base de datos
COPY huntechdb.sql /docker-entrypoint-initdb.d/

# Configura la base y el usuario de aplicación
RUN service mysql start && \
    mysql -e "CREATE DATABASE IF NOT EXISTS huntechdb;" && \
    mysql -e "CREATE USER 'huntech'@'localhost' IDENTIFIED BY '1029';" && \
    mysql -e "GRANT ALL PRIVILEGES ON huntechdb.* TO 'huntech'@'localhost';" && \
    mysql -e "FLUSH PRIVILEGES;"

# Arranca MariaDB y Apache juntos
CMD mysqld_safe & apache2-foreground

EXPOSE 80

