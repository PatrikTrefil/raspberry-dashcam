#!/bin/bash

set -euo pipefail

# remove files older than 3 days
find /home/pi/Videos/dashcam/ -type f -iname '*.mp4' -mtime +3 -exec rm {} \;

# start dashcam service
sudo systemctl start dashcam
