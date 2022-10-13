#!/bin/bash

set -euo pipefail

# remove files older than 3 days
find /data/pi/upload/Videos/dashcam/ -type f -iname '*.mp4' -mtime +1 -exec rm {} \;

# start dashcam service
sudo systemctl stop dashcam
sudo systemctl start dashcam
