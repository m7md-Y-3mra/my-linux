#!/bin/bash

# List available USB partitions (sdb1)
devices=$(lsblk -o NAME,SIZE,TYPE | awk '/sdb[0-9]* / {print $1 " (" $2 ")"}')

# Use dmenu to select a partition
selected_device=$(echo "$devices" | dmenu -i -p "Select USB partition to mount:")

# Check if a device was selected
if [ -n "$selected_device" ]; then
  # Extract the device name (removes the size info and just keeps the device name)
  device_name=$(echo "$selected_device" | awk '{print $1}' | sed 's/^├─//;s/^└─//') # Removes leading ├─ or └─
  device_path="/dev/$device_name"

  # Mount the partition using udisksctl
  mount_info=$(udisksctl mount -b "$device_path")

  # Check if the mount was successful by checking the output of udisksctl
  if [ $? -eq 0 ]; then
    # Extract the mount point from the udisksctl output
    mount_point=$(echo "$mount_info" | grep -oP 'at \K.*')
    notify-send "USB Mounted" "The USB partition has been mounted at $mount_point."

    # Open a new st terminal in the mounted directory
    st -e sh -c "cd '$mount_point' && exec sh" &

  else
    notify-send "Mount Failed" "Failed to mount $device_path. Check if the filesystem is valid."
  fi
else
  notify-send "No Selection" "No USB partition selected."
fi
