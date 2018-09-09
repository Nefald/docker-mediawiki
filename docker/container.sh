#!/bin/bash

cp -f /LocalSettings.php /var/www/html/LocalSettings.php

if [ ! -z "$WIKI_MYSQL_TYPE" ]; then
    sed -i "s/\$wgDBtype = \"{{WIKI_MYSQL_TYPE}}\"/\$wgDBtype = \"${WIKI_MYSQL_TYPE}\"/g" /var/www/html/LocalSettings.php
fi

if [ ! -z "$WIKI_MYSQL_HOST" ]; then
    sed -i "s/\$wgDBserver = \"{{WIKI_MYSQL_HOST}}\"/\$wgDBserver = \"${WIKI_MYSQL_HOST}\"/g" /var/www/html/LocalSettings.php
fi

if [ ! -z "$WIKI_MYSQL_DATABASE" ]; then
    sed -i "s/\$wgDBname = \"{{WIKI_MYSQL_DATABASE}}\"/\$wgDBname = \"${WIKI_MYSQL_DATABASE}\"/g" /var/www/html/LocalSettings.php
fi

if [ ! -z "$WIKI_MYSQL_USER" ]; then
    sed -i "s/\$wgDBuser = \"{{WIKI_MYSQL_USER}}\"/\$wgDBuser = \"${WIKI_MYSQL_USER}\"/g" /var/www/html/LocalSettings.php
fi

if [ ! -z "$WIKI_MYSQL_PASSWORD" ]; then
    sed -i "s/\$wgDBpassword = \"{{WIKI_MYSQL_PASSWORD}}\"/\$wgDBpassword = \"${WIKI_MYSQL_PASSWORD}\"/g" /var/www/html/LocalSettings.php
fi

if [ ! -z "$WIKI_MYSQL_PREFIX" ]; then
    sed -i "s/\$wgDBprefix = \"{{WIKI_MYSQL_PREFIX}}\"/\$wgDBprefix = \"${WIKI_MYSQL_PREFIX}\"/g" /var/www/html/LocalSettings.php
fi

/usr/local/bin/apache2-foreground