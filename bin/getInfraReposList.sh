#!/bin/bash
#
# Generate gitall repos file containing all repos from INFRA-* projects
#

URL=http://mtlstash.gv.grassvalley.com:7990
STRIP="ssh://git@mtlstash.gv.grassvalley.com:7999"
PROJECTS=(INFRA-BUILD INFRA-CORE INFRA-DENSITE INFRA-IP INFRA-LIB INFRA-MEDAF INFRA-TOOLS)
SLUGS=$(jq -r '.values[].slug' <<< $REPOS_JSON)
NUM_REPOS=$(wc -l <<< "$SLUGS")

getProjectReposList() {
   REPOS_JSON=$(curl -s -u $USER:$PASS "$URL/rest/api/1.0/projects/$proj/repos?size=150&limit=150")
   REPOS_NAMES=($(jq -r '.values[].slug' <<< $REPOS_JSON))
   echo $(jq '.values[].links.clone[] | select(.name=="ssh") | .href' <<< $REPOS_JSON)
}

# Ask for password
read -s -p "Enter host password for user '$USER': " PASS

echo "# Infra repositories" #> infra.repos

for proj in "${PROJECTS[@]}"; do
   #echo "Generating repos list for $proj..."
   echo "# $proj" #>> infra.repos
   REPOS_URLS=($(getProjectReposList $proj))
   for rep in "${REPOS_URLS[@]}"; do
      rep="${rep%\"}"
      rep="${rep#\"}"
      dir="${rep#$STRIP/}"
      dir="${dir%.git}"
      dir="${dir/-//}"
      echo "$rep,$dir,master" #>> infra.repos
      subdir="$(dirname $dir)"
      [ ! -d "$subdir" ] && mkdir -p "$subdir"
   done
done

unset PASS

