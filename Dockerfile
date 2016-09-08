FROM alpine:latest

RUN set -ex \

    # Install ruby
    && apk add --no-cache --virtual .deps ruby \

    # Install dependencies to build the bson_ext gem
    && apk add --no-cache --virtual .build-deps \
        ruby-rake \
        ruby-libs \
        ruby-dev \
        musl-dev \
        gcc \
        make \

    # Install Genghis
    && gem install --no-ri --no-rdoc bson_ext:'~>1.9.0' genghisapp \

    # Remove build dependencies
    && apk del .build-deps

CMD genghisapp --foreground --no-launch --no-update-check --servers ${DB_HOST}:${DB_PORT:-27017}

EXPOSE 5678

