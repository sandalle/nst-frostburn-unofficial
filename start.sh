#!/bin/bash

#Settings
[[ -f config.sh ]] && . config.sh
SERVICE="${FORGE:-server.jar}"
OPTIONS='nogui'
MCPATH="${SERVER_DIR}"
#	-Dfml.debugClassPatchManager=true -Dfml.debugRegistryEntries=true \
#	-XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:ParallelGCThreads=8 -XX:ConcGCThreads=2 -XX:InitiatingHeapOccupancyPercent=70 -XX:+DisableExplicitGC -XX:+UseFastAccessorMethods -XX:+AggressiveOpts -XX:-UseAdaptiveSizePolicy \
# Garbage Collector optimizations are from https://forums.spongepowered.org/t/optimized-startup-flags-for-consistent-garbage-collection/13239
INVOCATION="java -server  \
	-Xms${START_MEMORY}M -Xmx${MAX_MEMORY}M  \
	-XX:+UseLargePages  \
	-XX:+UseLargePagesInMetaspace  \
	-XX:+UseG1GC  \
	-XX:+UnlockExperimentalVMOptions  \
	-XX:MaxGCPauseMillis=100  \
	-XX:+DisableExplicitGC  \
	-XX:TargetSurvivorRatio=90  \
	-XX:G1NewSizePercent=50  \
	-XX:G1MaxNewSizePercent=80 \
	-XX:InitiatingHeapOccupancyPercent=10  \
	-XX:G1MixedGCLiveThresholdPercent=50  \
	-XX:+AggressiveOpts  \
	-XX:+AlwaysPreTouch  \
	-Djline.terminal=jline.UnsupportedTerminal -Djava.util.prefs.userRoot=${SERVER_DIR}  \
	-Dfml.doNotBackup=true -Dfml.queryResult=confirm  \
	-Djava.net.preferIPv4Stack=true  \
	-jar $SERVICE $OPTIONS"

${INVOCATION}
