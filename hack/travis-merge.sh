#!/bin/bash

echo "TRAVIS_BRANCH: $TRAVIS_BRANCH"

if [ "$TRAVIS_BRANCH" == "master" ]; then 
    exit 0;
fi

export GIT_COMMITTER_EMAIL="cdoan@redhat.com"
export GIT_COMMITTER_NAME="Chris Doan"

git config --add remote.origin.fetch +refs/heads/*:refs/remotes/origin/* || exit
git fetch --all || exit
git checkout master || exit
git merge --no-ff "$TRAVIS_COMMIT" || exit
git push https://${GITHUB_TOKEN}@github.com/cdoan1/pytorch-imageclassifier.git
