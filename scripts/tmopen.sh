#!/usr/bin/env bash

# tmopen - Open a tmux session for a given project
# Usage: tmopen <path_or_url> [session_name]

set -e

# Function to get the session name from a path
get_session_name() {
  local path=$1
  basename "$path" | tr '.' '-'
}

# Function to extract repo name from URL
get_repo_name_from_url() {
  local url=$1
  # Extract the part after the last slash and before .git (if present)
  basename=$(basename "$url")
  echo "${basename%.git}" | tr '.' '-'
}

# Check if a parameter was provided
if [ -z "$1" ]; then
  echo "Usage: tmopen <path_or_url> [session_name]"
  exit 1
fi

input=$1
is_url=false

# Check if the input is a URL
if [[ $input == http* ]]; then
  is_url=true
fi

if [ "$is_url" = true ]; then
  # Handle URL (git repository)
  TEMP_DIR=$(mktemp -d)
  echo "Cloning repository to temporary directory: $TEMP_DIR"
  git clone "$input" "$TEMP_DIR"
  project_path=$TEMP_DIR
  # For URLs, get the session name from the repo name in the URL
  auto_session_name=$(get_repo_name_from_url "$input")
else
  # Handle local path
  if [ ! -d "$input" ]; then
    echo "Error: Directory does not exist: $input"
    exit 1
  fi
  project_path=$(realpath "$input")
  # For local paths, get the session name from the directory name
  auto_session_name=$(get_session_name "$project_path")
fi

# Use the provided session name if available, otherwise use the auto-generated one
if [ -n "$2" ]; then
  session_name="$2"
  echo "Using provided session name: $session_name"
else
  session_name="$auto_session_name"
  echo "Using auto-generated session name: $session_name"
fi

# Check if the session already exists
if tmux has-session -t "$session_name" 2>/dev/null; then
  echo "Session '$session_name' already exists..."
else
  echo "Creating new session '$session_name' at $project_path"
  tmux new-session -d -s "$session_name" -c "$project_path"
fi

# Connect to the new session
if [ -n "$TMUX" ]; then
  tmux switch-client -t "$session_name"
else
  tmux attach-session -t "$session_name"
fi
