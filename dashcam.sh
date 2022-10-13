#!/bin/bash

set -euo pipefail

# let's save everything to DATA_DIR (in my specific case that folder is shared via sftp)
DATA_DIR="/data/pi/upload/"
LOG_FILE="${DATA_DIR}/Logs/dashcam.log"
VIDEO_DIR="${DATA_DIR}/Videos/dashcam/"

when="$(date '+%Y-%m-%d--%H-%M')"

# log start of script
log_dir="$(dirname "$LOG_FILE")"
mkdir -p "$log_dir"
touch "$LOG_FILE"
echo "Started at: $when" | tee --append "$LOG_FILE" 1>/dev/null

# start recording; save to VIDEO_DIR and include timestamp in filename
mkdir -p "$VIDEO_DIR"
ffmpeg -i /dev/video0 "${VIDEO_DIR}${when}.mp4" &
