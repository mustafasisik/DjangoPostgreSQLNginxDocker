#!/bin/sh

if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."

    while ! nc -z $SQL_HOST $SQL_PORT; do
      sleep 0.1
    done

    echo "PostgreSQL started"

    echo "Database migration"
    python manage.py migrate --noinput

    echo "Collect static files"
    python manage.py collectstatic --no-input --clear
fi

exec "$@"