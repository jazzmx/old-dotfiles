#!/bin/bash
#
# Get repository list of specified project from specified url
#
# Usage:
#     getBitBucketReposList.sh PROJECT [URL]
#
# Pre-requisites: curl, jq
#

PROJECT="$1"
URL="${2:-http://mtlstash.gv.grassvalley.com:7990}"
REPOS_JSON=$(curl -s -u $USER "$URL/rest/api/1.0/projects/$PROJECT/repos?size=150&limit=150")
SLUGS=$(jq -r '.values[].slug' <<< $REPOS_JSON)
NUM_REPOS=$(wc -l <<< "$SLUGS")
reps=($(jq '.values[].links.clone[] | select(.name=="ssh") | .href' <<< $REPOS_JSON))

for rep in "${reps[@]}"; do
   rep="${rep%\"}"
   rep="${rep#\"}"
   echo $rep,,master
done

