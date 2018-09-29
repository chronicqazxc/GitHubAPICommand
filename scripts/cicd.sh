#!/bin/bash
BRANCH=$1
if [[ $BRANCH =~ "master" ]]; then
    bundle exec fastlane cicd
elif [[ $BRANCH =~ "develop" ]]; then
    bundle exec fastlane cicd
elif [[ $BRANCH =~ "release" ]]; then
    bundle exec fastlane cicd
else
    bundle exec fastlane cicd
fi
