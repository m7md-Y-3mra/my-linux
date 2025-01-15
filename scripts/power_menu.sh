#!/bin/bash

# Options for power management
OPTIONS="Poweroff\nReboot\nSuspend\nLock\nLogout"

# Show options using dmenu and store the selected option
CHOSEN=$(echo -e "$OPTIONS" | dmenu -i -p "Choose action:")

# Perform the corresponding action based on the user's choice
case "$CHOSEN" in
Poweroff)
  doas poweroff
  ;;
Reboot)
  doas reboot
  ;;
Suspend)
  doas systemctl suspend
  ;;
Lock)
  slock # Assuming you're using slock for screen locking
  ;;
Logout)
  pkill -KILL -u $USER # Logout (kills all user processes)
  ;;
*) ;;
esac
