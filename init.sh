#!/bin/bash
echo "Initializing project..."

# Set up backend
cd backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python manage.py migrate
deactivate
cd ..

# Set up frontend
cd frontend
flutter pub get
cd ..

echo "Project initialized successfully!"
