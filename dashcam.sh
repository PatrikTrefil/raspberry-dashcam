#!/bin/bash

set -euo pipefail

LOG_FILE="${HOME}/Logs/dashcam.log"
VIDEO_DIR="${HOME}/Videos/dashcam/"

when="$(date '+%Y-%m-%d--%H-%M')"

# log start of script
log_dir="$(dirname "$LOG_FILE")"
mkdir -p "$log_dir"
touch "$LOG_FILE"
echo "Started at: $when" | tee "$LOG_FILE" 1>/dev/null

# start recording; save to VIDEO_DIR and include timestamp in filename
ffmpeg -i /dev/video0 "${VIDEO_DIR}${when}.mp4"
