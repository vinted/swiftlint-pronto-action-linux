#!/bin/bash

apt-get -y update && apt-get install -y openssl curl
apt-get -y install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev libssl-dev cmake

git remote set-url origin https://x-access-token:$GITHUB_TOKEN@github.com/$GITHUB_REPOSITORY
git fetch --no-tags --prune origin +refs/heads/*:refs/remotes/origin/*

# rvm
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -L https://get.rvm.io | bash -s stable

source /etc/profile.d/rvm.sh

# ruby
rvm install ruby-2.5.0

# bundler
gem install bundler --no-ri --no-rdoc

gem install pronto pronto-swiftlint

export PRONTO_PULL_REQUEST_ID=$GITHUB_PULL_REQUEST_ID
export PRONTO_GITHUB_ACCESS_TOKEN=$GITHUB_TOKEN

pronto run -c origin/$DIFF_BASE -r swiftlint -f github_status github_pr