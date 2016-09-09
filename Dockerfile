FROM kovagoz/php:5.6-mongo

RUN set -ex \

    && curl -Ls https://github.com/bobthecow/genghis/archive/v2.3.11.zip > /tmp/genghis.zip \
    && unzip /tmp/genghis.zip genghis-2.3.11/genghis.php -p > genghis.php \
    && rm /tmp/genghis.zip

ENTRYPOINT php -S 0.0.0.0:8000 -d date.timezone=${TIMEZONE:-Europe/Budapest} genghis.php

EXPOSE 8000
