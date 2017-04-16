#!/bin/bash

# Make a new release based on VERSION
GPG_USER='sandalle@gmail.com'
VERSION=$(cat VERSION)
git tag -u ${GPG_USER} --sign -m "frostburn-${VERSION}" "frostburn-${VERSION}"  &&
git push --all  &&
git push --tags
