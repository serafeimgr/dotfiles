#!/bin/bash
repo="https://$(git remote get-url origin | awk -F @ '{print $2}' | tr ':' '/')"
post_fix=".git"

echo "${repo%"$post_fix"}"
