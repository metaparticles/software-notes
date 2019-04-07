#!/bin/bash

export PATH="/usr/local/opt/ruby/bin:$PATH"
git checkout master
git pull origin master
git branch -D gh-pages
git checkout -b gh-pages
bundle install --path vendor/bundle
bundle exec jekyll build -s _source
rm .gitignore
rm -rf _source
cp -R _output/ .
rm -rf _output
# git add .
# git commit -m "Deployment push"
# git push -f origin gh-pages
# git stash
# git checkout master
# git branch -D gh-pages
