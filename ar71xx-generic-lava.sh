#!/bin/bash
# 2018 Alexander Couzens <lynxis@fe80.eu>
# GPLv2

# optional envs:
#
# LAVA_USER
# LAVA_URL
#
# required envs:
#
# BOARD - defining the board to test
# IMAGE_URL - url to the an image (e.g. produced by jenkins)

if [ ! -e "job-templates/$BOARD.yml" ] ; then
	echo "Can not find the template"
	exit 127
fi

TEMPLATE_FILE="job-templates/$BOARD.yml"
if [ ! -e "$TEMPLATE_FILE" ] ; then
	echo "Can not find the template file '$TEMPLATE_FILE'"
fi

IMAGE_NAME_FILE="boards/$BOARD.image.initramfs"
if [ ! -e "$IMAGE_NAME_FILE" ] ; then
	echo "Can not find the image name file '$IMAGE_NAME_FILE'"
fi

IMAGE_NAME="$(cat "$IMAGE_NAME_FILE")"
export IMAGE_URL="$IMAGE_URL$IMAGE_NAME"
export JOB_NAME="jenkins_$BUILD_NUMBER"
export TEMPLATE_FILE
export LAVA_USER

if [ -n "$BRANCH" ] ; then
	export BRANCH=$(echo "$BRANCH" | awk 's!origin/!!g')
fi

./bin/run-lava-job.sh
