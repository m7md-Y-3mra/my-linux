#!/bin/bash

# Check if a video name is provided
if [ -z "$1" ]; then
  echo "Usage: ./record_screen.sh <output_filename>"
  exit 1
fi

# Run ffmpeg command with the provided filename
ffmpeg -video_size 1366x7 -framerate 30 -f x11grab -i :0.0 "$1".mp4
