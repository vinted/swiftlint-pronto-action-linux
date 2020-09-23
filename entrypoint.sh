#!/bin/bash

git remote set-url origin https://x-access-token:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY
git fetch --no-tags --prune origin +refs/heads/*:refs/remotes/origin/*

export PRONTO_PULL_REQUEST_ID=$GITHUB_PULL_REQUEST_ID
export PRONTO_GITHUB_ACCESS_TOKEN=$GITHUB_TOKEN

pronto run -c origin/$DIFF_BASE -r swiftlint -f github_status github_pr