#!/usr/bin/env bash

# this file was adapted from https://gist.github.com/leonmydla/3ad1e6ccec879a499490290e41fd1a06

# The repo_file should contain a list of remotes to clone.
# Every remote is put in a single line
# The file has to end on an empty line

repo_file="repos.txt"

if ! [[ -f $repo_file ]]; then
  echo "$repo_file file doesn't exist"
  exit 1
fi

check_is_missing_or_git_repo () {
  repo_dir=$1
  repo_address=$2

  if ([[ -e $repo_dir ]] && [[ ! -d $repo_dir ]]) || [[ $(git -C "$repo_dir" remote get-url origin 2> /dev/null) != $repo_address ]]; then
    echo "$repo_dir doesn't appear to represent the wanted git remote."
    exit 1
  fi
}

file_lines_as_argument () {
  command=$1
  file=$2

  while read line; do
    $command $line
  done < $file
}

file_lines_as_argument check_is_missing_or_git_repo $repo_file
file_lines_as_argument "git clone" $repo_file
