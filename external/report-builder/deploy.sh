#!/bin/bash

set -e  # Exit on error

echo "Deploying to Google Cloud Run..."
echo "Using PROJECT=$PROJECT"

cd "$(dirname "$0")"

# Build the Docker image from the Dockerfile
gcloud builds submit . \
  --tag gcr.io/$PROJECT/my-service

# Deploy the container to Cloud Run
gcloud run deploy my-service \
  --image gcr.io/$PROJECT/my-service \
  --region us-central1 \
  --project=$PROJECT \
  --allow-unauthenticated \
  --concurrency=1 \
  --no-cpu-throttling \
  --timeout 2400 \
  --memory 12Gi \
  --cpu 4 \
  --service-account=service-workflow-test@test-cloud-453720.iam.gserviceaccount.com \
  --set-env-vars=GH_TOKEN="$GH_TOKEN",CLIENT_EMAIL="$CLIENT_EMAIL",PROJECT_ID="$PROJECT",PRIVATE_KEY="$PRIVATE_KEY"

echo "✅ Deployment successful!"
