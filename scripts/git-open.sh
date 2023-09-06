#!/bin/bash

filename=$1
linerange=$2  # This is now optional

git_config="$(git rev-parse --show-toplevel)/.git/config"

# Git the repo URL
repo_url=$(grep "url =" $git_config | sed 's/	url = //g')

# Convert SSH URL to HTTPS if needed
if [[ $repo_url == git@* ]]; then
  repo_domain=$(echo $repo_url | awk -F':' '{print $1}' | sed 's/git@//')
  repo_path=$(echo $repo_url | awk -F':' '{print $2}')
  repo_url="https://$repo_domain/$repo_path"
fi

# Get the current commit
current_commit=$(git rev-parse HEAD)

# Handle github vs gitlab 
if [[ $repo_url == *"github.com"* ]]; then
  platform="github"
elif [[ $repo_url == *"gitlab.com"* ]]; then
  platform="gitlab"
else
  echo "Unknown platform"
  exit 1
fi

# Generate the final URL
if [[ $platform == "github" ]]; then
  final_url="${repo_url%.git}/blob/$current_commit/${filename}"
  # Format line range for GitHub
  if [ ! -z "$linerange" ]; then
    linerange="L${linerange%-*}-L${linerange#*-}"
  fi
elif [[ $platform == "gitlab" ]]; then
  final_url="${repo_url%.git}/-/blob/$current_commit/${filename}"
fi

# Add line range if it exists
if [ ! -z "$linerange" ]; then
  final_url="${final_url}#L${linerange}"
fi

echo $final_url
