#!/usr/bin/env bash

gitRemoteURL=$(git config --get remote.origin.url)
scriptDirectory=$(dirname $0)
configuration="${scriptDirectory}/config.sh"
source $configuration

if [ $gitRemoteURL = $myRepositoryURL ];
then

  lastModifiedUser=$(git log --format='%an' -n 1)
  lastModifiedTitle=$(git log --format='%s' -n 1)
  message="[Server]\nUser **${lastModifyUser}** sends a commit. \nCommit title: **${lastModifyTitle}**"

  curl -H "Content-Type: application/json" \
  -X POST \
  -d "{\"username\": \"${username}\", \"content\": \"${message}\"}" $url
fi
