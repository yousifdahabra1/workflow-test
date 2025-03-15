#!/bin/bash


gcloud run deploy blinkmetrics-report-builder \
    --source . \
    --region us-central1 \
    --project=$PROJECT \
    --port 443 \
    --allow-unauthenticated \
    --concurrency=1 \
    --no-cpu-throttling \
    --timeout 2400 \
    --memory 12Gi \
    --cpu 4 \
    --service-account=service-workflow-test@test-cloud-453720.iam.gserviceaccount.com \
    --set-env-vars=GH_TOKEN="$GH_TOKEN",CLIENT_EMAIL="$CLIENT_EMAIL",PROJECT_ID="$PROJECT",PRIVATE_KEY="$PRIVATE_KEY"
