FROM php:7.2-apache
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN a2enmod rewrite
COPY . /var/www/html


#COPY . /usr/src/myapp
#WORKDIR /usr/src/myapp
#CMD [ "php", "./your-script.php" ]



#FROM wordpress:latest

#WORKDIR /var/www/html

#COPY . /var/www/html

EXPOSE 80