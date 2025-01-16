#!/bin/bash

# Project Variables
PROJECT_NAME="brain_health_monitor"
FRONTEND_DIR="$PROJECT_NAME/frontend"
BACKEND_DIR="$PROJECT_NAME/backend"

# Create Project Structure
echo "Creating project directories..."
mkdir -p $FRONTEND_DIR $BACKEND_DIR/{apps,config,static,media}

# Initialize Git Repository
echo "Initializing Git repository..."
cd $PROJECT_NAME
git init

# Backend Setup (Django)
echo "Setting up Django backend..."
cd $BACKEND_DIR
python3 -m venv venv
source venv/bin/activate
pip install django djangorestframework djangorestframework-simplejwt psycopg2-binary mne numpy scipy tensorflow matplotlib
django-admin startproject config .

# Generate Initial Apps
python manage.py startapp health_monitor
python manage.py startapp user_management
deactivate

# Frontend Setup (Flutter)
echo "Setting up Flutter frontend..."
cd ../../$FRONTEND_DIR
flutter create brain_health_monitor_frontend
cd brain_health_monitor_frontend
flutter pub add charts_flutter http provider

# Finalize
cd ../..
echo "Project setup complete! Start developing with $PROJECT_NAME."