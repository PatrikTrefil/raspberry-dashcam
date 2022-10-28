#!/bin/bash

set -euo pipefail

# keep this at a minimum, because the files
# are going to be large
# if you want to keep more videos,
# you need to setup another service
# to compress the videos (I could not get Raspberry
# to do it on the fly)
HOURS_LIMIT=8
# remove files older than $HOURS_LIMIT
find /data/pi/upload/Videos/dashcam/ -type f -iname '*.mp4' -mmin "+$((HOURS_LIMIT * 60))" -exec rm {} \;

# start dashcam service
sudo systemctl stop dashcam
sudo systemctl start dashcam
