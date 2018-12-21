#!/bin/bash

cp -f /LocalSettings.php /var/www/html/LocalSettings.php


# BDD
if [ ! -z "$WIKI_MYSQL_PREFIX" ]; then
    sed -i "s/{{WIKI_MYSQL_TYPE}}/mysql/g" /var/www/html/LocalSettings.php
fi
if [ ! -z "$WIKI_MYSQL_PREFIX" ]; then
    sed -i "s/{{WIKI_MYSQL_HOST}}/mysql/g" /var/www/html/LocalSettings.php
fi
if [ ! -z "$WIKI_MYSQL_PREFIX" ]; then
    sed -i "s/{{WIKI_MYSQL_DATABASE}}/${DB_WIKI_NAME}/g" /var/www/html/LocalSettings.php
fi
if [ ! -z "$WIKI_MYSQL_PREFIX" ]; then
    sed -i "s/{{WIKI_MYSQL_USER}}/root/g" /var/www/html/LocalSettings.php
fi
if [ ! -z "$WIKI_MYSQL_PREFIX" ]; then
    sed -i "s/{{WIKI_MYSQL_PASSWORD}}/${DB_WIKI_PASSWORD}/g" /var/www/html/LocalSettings.php
fi
if [ ! -z "$WIKI_MYSQL_PREFIX" ]; then
    sed -i "s/{{WIKI_MYSQL_PREFIX}}/${DB_WIKI_PREFIX}/g" /var/www/html/LocalSettings.php
fi

# SMTP
if [ ! -z "$WIKI_MYSQL_PREFIX" ]; then
    sed -i "s/{{SMTP_HOST}}/${DB_WIKI_PREFIX}/g" /var/www/html/LocalSettings.php
fi
if [ ! -z "$WIKI_MYSQL_PREFIX" ]; then
    sed -i "s/{{SMTP_ID_HOST}}/${DB_WIKI_PREFIX}/g" /var/www/html/LocalSettings.php
fi
if [ ! -z "$WIKI_MYSQL_PREFIX" ]; then
    sed -i "s/{{SMTP_PORT}}/${DB_WIKI_PREFIX}/g" /var/www/html/LocalSettings.php
fi
if [ ! -z "$WIKI_MYSQL_PREFIX" ]; then
    sed -i "s/{{SMTP_USERNAME}}/${DB_WIKI_PREFIX}/g" /var/www/html/LocalSettings.php
fi
if [ ! -z "$WIKI_MYSQL_PREFIX" ]; then
    sed -i "s/{{SMTP_PASSWORD}}/${DB_WIKI_PREFIX}/g" /var/www/html/LocalSettings.php
fi

# Secret
if [ ! -z "$WIKI_MYSQL_PREFIX" ]; then
    sed -i "s/{{WIKI_SECRET_KEY}}/${WIKI_SECRET_KEY}/g" /var/www/html/LocalSettings.php
fi

# WIKI infos
if [ ! -z "$WIKI_MYSQL_PREFIX" ]; then
    sed -i "s/{{WIKI_LANG}}/${WIKI_LANG}/g" /var/www/html/LocalSettings.php
fi
if [ ! -z "$WIKI_MYSQL_PREFIX" ]; then
    sed -i "s/{{WIKI_SITENAME}}/${WIKI_SITENAME}/g" /var/www/html/LocalSettings.php
fi

# URL
if [ ! -z "$WIKI_MYSQL_PREFIX" ]; then
    sed -i "s/{{WIKI_URL}}/http:\/\/wiki.${HOSTNAME_NEFALD}/g" /var/www/html/LocalSettings.php
fi

/usr/local/bin/apache2-foreground