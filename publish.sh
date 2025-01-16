#!/bin/bash
echo "Publishing application..."

# Publish backend
echo "Publishing backend to Google Cloud Run..."
gcloud run deploy brain-health-backend \
    --image gcr.io/YOUR_PROJECT_ID/brain_health_backend:latest \
    --region YOUR_REGION

# Publish frontend to stores
echo "Publishing Android app to Play Store..."
fastlane supply --apk frontend/build/app/outputs/flutter-apk/app-release.apk --track production

echo "Publishing iOS app to App Store..."
fastlane deliver --ipa frontend/build/ios/ipa/app.ipa --skip_screenshots

echo "Publishing complete!"
