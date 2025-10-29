#!/bin/bash
# Railway deployment script
echo "Starting Railway deployment setup..."

# Install dependencies
pip install -r requirements.txt

# Run migrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --noinput

# Create superuser if it doesn't exist (optional)
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(username='admin').exists() or User.objects.create_superuser('admin', 'admin@example.com', 'admin')" | python manage.py shell

# Sync initial data from Supabase (optional)
python manage.py sync_supabase

echo "Railway setup completed!"

