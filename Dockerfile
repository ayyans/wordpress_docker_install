FROM php:7.2-apache
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN a2enmod rewrite

# Change ownership to www-data (Apache/PHP default user)
# Replace /var/www/html with your WordPress root if different
RUN chown -R www-data:www-data /var/www/html

# Set correct permissions for WordPress directories and files
RUN find /var/www/html -type d -exec chmod 755 {} \; && \
    find /var/www/html -type f -exec chmod 644 {} \;
	
# Commands to adjust permissions
RUN chown -R www-data:www-data /var/www/html/wp-content && \
    find /var/www/html/wp-content -type d -exec chmod 755 {} \; && \
    find /var/www/html/wp-content -type f -exec chmod 644 {} \;

	
# Copy your entrypoint script into the container
COPY docker-entrypoint.sh /usr/local/bin/

# Make sure the script is executable
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Set your script to be the new entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]	