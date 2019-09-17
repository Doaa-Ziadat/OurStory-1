#!/usr/bin/env bash

if [[ ( "$TRAVIS_BRANCH" = "master"  ) ]]; then
    cp app/build/outputs/apk/debug/app-debug.apk ./`echo $TRAVIS_COMMIT`-debug.apk
    pip3 install -r requirements.txt
    curl -F file=`echo $TRAVIS_COMMIT`-debug.apk -F channels="#ourstory-apks" -H "Authorization: Bearer $SLACK_API_TOKEN" https://slack.com/api/files.upload
fi