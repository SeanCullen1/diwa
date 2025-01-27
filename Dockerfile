FROM php:7-apache

COPY ./app /var/www/html
COPY ./docs /var/www/docs
COPY ./database /var/www/database

RUN cd .. && chown www-data. . -R

COPY --from=contrast/agent-php:latest /contrast/contrast.so /usr/local/lib/contrast/php/
RUN echo "extension=/usr/local/lib/contrast/php/contrast.so" >> $(php-config --ini-path)/php.ini
