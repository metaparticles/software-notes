#!/bin/bash

export PATH="/usr/local/opt/ruby/bin:$PATH"
git stash
git checkout master
git pull origin master
git branch -D gh-pages
git checkout -b gh-pages
bundle update
bundle install
bundle exec jekyll build -s _source
rm .gitignore
touch .gitignore
echo "*.bundle" >> .gitignore
echo "*vendor*" >> .gitignore
rm -rf _source
cp -R _output/ .
rm -rf _output
git add .
git commit -m "Deployment push"
git push -f origin gh-pages
rm -rf *
git checkout .
git clean -f
git checkout master
git branch -D gh-pages
