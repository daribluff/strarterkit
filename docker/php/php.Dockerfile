FROM php:7.0-apache

ENV http_proxy=http://CptLinuxWeb:LinuxWeb@10.169.119.6:3128
ENV https_proxy=http://CptLinuxWeb:LinuxWeb@10.169.119.6:3128
ENV HTTP_PROXY=http://CptLinuxWeb:LinuxWeb@b10.169.119.6:3128
ENV HTTPS_PROXY=http://CptLinuxWeb:LinuxWeb@10.169.119.6:3128
ENV NO_PROXY=127.0.0.1

# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

RUN apt-get update
RUN apt-get install -y make
RUN apt-get install -y gcc
RUN apt-get install -y libxslt-dev libxml2-dev
RUN apt-get install -y wget git-core

RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
&& curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
# Make sure we're installing what we think we're installing!
&& php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
&& php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
&& rm -f /tmp/composer-setup.*docker co

EXPOSE 9000
CMD ["php-fpm"]