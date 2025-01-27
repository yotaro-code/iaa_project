#!/bin/bash

PROJECT_ID="carbon-crossing-446001-p7"
SERVICE_ACCOUNT="ai-interview-agents-sa@$PROJECT_ID.iam.gserviceaccount.com"

ROLES=(
  "roles/run.invoker"
  "roles/datastore.user"
  "roles/texttospeech.user"
  "roles/speech.user"
  "roles/aiplatform.user"
)

for ROLE in "${ROLES[@]}"; do
  echo "Assigning $ROLE to $SERVICE_ACCOUNT..."
  gcloud projects add-iam-policy-binding $PROJECT_ID \
      --member="serviceAccount:$SERVICE_ACCOUNT" \
      --role="$ROLE"
done

echo "All roles assigned successfully."
