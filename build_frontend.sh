#!/bin/bash
echo "Building frontend for Android and iOS..."
cd frontend

# Build Android APK
flutter build apk --release

# Build iOS (requires macOS)
flutter build ipa --release

cd ..
