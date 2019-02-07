FROM alpine:3.9
 
LABEL Maintainer="Mathew Beane <aepod23@gmail.com>" \
      Description="Alpine Conductor Build Container"

# Install packages
RUN apk --no-cache add php7 php7-fpm php7-mysqli php7-json  php7-zlib\
    php7-xml php7-phar php7-posix php7-mbstring php7-pdo \
	openssh-client git supervisor curl patch nodejs yarn npm  
RUN npm install --global gulp-cli
	
# Configure PHP-FPM
COPY config/fpm-pool.conf /etc/php7/php-fpm.d/www.conf
COPY config/php.ini /etc/php7/conf.d/zzz_custom.ini

# Configure supervisord
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Setup document root
RUN mkdir -p /var/www/html

# Switch to use a non-root user from here on
USER nobody

# Add application
WORKDIR /var/www/html
COPY --chown=nobody src/ /var/www/html/

# Let supervisord start php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

