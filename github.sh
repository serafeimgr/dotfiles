#!/bin/bash
repo="https://$(git remote get-url origin | awk -F @ '{print $2}' | tr ':' '/')"
post_fix=".git"

repo="${repo%"$post_fix"}"

echo "$repo" && echo "$repo" | pbcopy
