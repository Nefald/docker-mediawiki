FROM mediawiki

LABEL maintainer="nefald.fr"

RUN apt-get update && apt-get install -y \
    perl \
    ploticus


COPY container.sh /usr/local/bin/container.sh

ADD "wiki/extensions" "/var/www/html/extensions"

ADD "wiki/skins" "/var/www/html/skins"

RUN chmod +x /usr/local/bin/container.sh

CMD sh /usr/local/bin/container.sh