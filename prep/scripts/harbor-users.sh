#!/bin/sh

set -e
#expects that you have these three env vars set:
#HARBOR_USER
#HARBOR_PASSWORD
#HARBOR_PROJECT_ID

for i in {1..25} 
do
    
    username="kuber${i}"
    echo "adding to project"
    curl -k -u "${HARBOR_USER}:${HARBOR_PASSWORD}" "https://harbor.workshop.k8s.warroyo.com/api/projects/$HARBOR_PROJECT_ID/members" \
    -H 'Content-Type: application/json' \
    --data-binary '{"role_id":1,"member_user":{"username":"'$username'"}}'
done