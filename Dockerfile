FROM postgis/postgis:14-master

RUN apt-get -y update && \
    apt-get -y install pwgen && \
    apt-get -y clean


LABEL org.opencontainers.image.title="custom PostGIS image with app user/schema create" \
    org.opencontainers.image.authors="frederic.cloitre@lpo.fr" \
    com.docker.extension.publisher-url="https://github.com/lpoaura/" \
    org.opencontainers.image.vendor="LPO Auvergne-Rhône-Alpes"


COPY scripts/init-user-db.sh /docker-entrypoint-initdb.d/
