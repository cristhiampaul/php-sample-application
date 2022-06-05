FROM mattrayner/lamp:0.8.0-1804-php7

WORKDIR /usr/local/apache2/htdocs
COPY . .
RUN apt-get update && apt-get install make && \
apt-get install -y wget && apt-get install -y git && apt-get install -y zip 
RUN cat config-apache.txt > /etc/apache2/sites-available/000-default.conf
RUN service apache2 restart
RUN make
RUN chmod -R 777 /usr/local/apache2/htdocs/error_handler.php
RUN ln -snf ../vendor/willdurand/negotiation/src/Negotiation/ src/Negotiation
