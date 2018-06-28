#!/bin/bash
set -ev
#run only on master
if [[ $TRAVIS_PULL_REQUEST == "false" ]] && [[ $TRAVIS_BRANCH == "master" ]]; then
  cd ..
  firebase use prod --token $FIREBASE_TOKEN
  firebase deploy --non-interactive --token $FIREBASE_TOKEN
  node bs.js $BSNAME $BSKEY
fi