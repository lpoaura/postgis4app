#!/bin/bash
set -e

export POSTGRES_APP_PASSWORD=${POSTGRES_APP_PASSWORD:-$(pwgen -B 16 1)}

echo $POSTGRES_APP_USER:$POSTGRES_APP_PASSWORD >/var/lib/postgresql/data/app.pwd

echo "USER SETTINGS"
cat /var/lib/postgresql/data/app.pwd

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER ${POSTGRES_APP_USER:-app} LOGIN ENCRYPTED PASSWORD '${POSTGRES_APP_PASSWORD}';
	CREATE SCHEMA AUTHORIZATION ${POSTGRES_APP_USER};
	ALTER ROLE ${POSTGRES_APP_USER} set search_path="\$user",public;
EOSQL
