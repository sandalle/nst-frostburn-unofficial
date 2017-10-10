#!/bin/bash
#
# $1 = server directory to archive

if [[ "x$#" != "x1" ]]; then
	echo "Usage: ${0} <server directory>"  &&
	exit 1
fi &&

# Include these files/folders
archiveList="asm/ \
	config.sh \
	config/ \
	forge*.jar \
	libraries/ \
	minecraft_server.1.11.2.jar \
	modpack/ \
	mods/ \
	scripts/ \
	server.properties.template \
	start.sh"

# Exclude these files/folders
excludeList="config/purpleirc/bots/*"

cd "${1}" &&
zip -r ../"${1///}".zip ${archiveList} --exclude ${excludeList} &&
cd -
