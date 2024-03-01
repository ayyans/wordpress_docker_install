#!/bin/bash

# Adjust permissions
chown -R www-data:www-data /var/www/html
find /var/www/html -type d -exec chmod 755 {} \;
find /var/www/html -type f -exec chmod 644 {} \;

# Execute the original entrypoint
exec docker-entrypoint.sh apache2-foreground
