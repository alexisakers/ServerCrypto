#!/bin/bash
set -e

if [[ $TRAVIS_OS_NAME == 'osx' ]]; then
    make build-mac
    make test-mac
fi

if [[ $TRAVIS_OS_NAME == 'linux' ]]; then
    make build-linux
    make test-linux
fi