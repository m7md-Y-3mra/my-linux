#!/bin/bash

# List currently mounted USB partitions
mounted_devices=$(lsblk -o NAME,SIZE,MOUNTPOINT | awk '/sdb[0-9]* / {print $1 " (" $2 ") - Mounted at: " $3}')

# Use dmenu to select a mounted partition
selected_device=$(echo "$mounted_devices" | dmenu -i -p "Select USB partition to unmount:")

# Check if a device was selected
if [ -n "$selected_device" ]; then
  # Extract the device name (removes the size and mount point info and just keeps the device name)
  device_name=$(echo "$selected_device" | awk '{print $1}' | sed 's/^├─//;s/^└─//') # Removes leading ├─ or └─
  device_path="/dev/$device_name"

  # Unmount the partition using udisksctl
  unmount_info=$(udisksctl unmount -b "$device_path")

  # Check if the unmount was successful by checking the output of udisksctl
  if [ $? -eq 0 ]; then
    notify-send "USB Unmounted" "The USB partition $device_path has been unmounted."

  else
    notify-send "Unmount Failed" "Failed to unmount $device_path. Check if the partition is busy."
  fi
else
  notify-send "No Selection" "No USB partition selected."
fi
