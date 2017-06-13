#!/bin/bash

# Make a new release based on VERSION
GPG_USER='sandalle@gmail.com'
VERSION=$(cat VERSION)
NEXT_VERSION=$(perl -pe 's/^((\d+\.)*)(\d+)(.*)$/$1.($3+1).$4/e' <<< ${VERSION})

# Tag current version
git tag -u ${GPG_USER} --sign -m "frostburn-${VERSION}" "frostburn-${VERSION}"  &&

# Increment to next version
echo ${NEXT_VERSION} > VERSION  &&
sed -i "s/S:modPackVersion=.*/S:modPackVersion=${VERSION}/" config/Mercurius.cfg  &&
git commit -m "Starting ${NEXT_VERSION}" VERSION config/Mercurius  &&

# Push new version and tags
git push --all  &&
git push --tags
