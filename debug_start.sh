#!/bin/bash
set -e

echo "=== Django Debug Startup ==="
echo "Current directory: $(pwd)"
echo "Python version: $(python --version)"
echo "Django version: $(python -c 'import django; print(django.get_version())')"

echo "=== Environment Variables ==="
echo "SECRET_KEY: ${SECRET_KEY:0:10}..."
echo "DEBUG: $DEBUG"
echo "ALLOWED_HOSTS: $ALLOWED_HOSTS"
echo "DATABASE_URL: ${DATABASE_URL:0:20}..."

echo "=== Testing Django ==="
python manage.py check --deploy

echo "=== Running Migrations ==="
python manage.py migrate --noinput

echo "=== Collecting Static Files ==="
python manage.py collectstatic --noinput

echo "=== Starting Server ==="
python manage.py runserver 0.0.0.0:$PORT
