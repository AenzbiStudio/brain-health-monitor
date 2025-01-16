#!/bin/bash
echo "Building backend Docker image..."
cd backend
docker build -t brain_health_backend:latest .
cd ..
