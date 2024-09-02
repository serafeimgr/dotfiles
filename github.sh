#!/bin/bash
repo_url="https://$(git remote get-url origin | awk -F @ '{print $2}' | tr ':' '/')"
post_fix=".git"

url="${repo_url%"$post_fix"}"

echo "$url" && echo "$url" | pbcopy
