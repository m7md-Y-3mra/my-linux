#!/bin/bash

# Function to get the power consumption using powertop
get_power_consumption() {
  # Run powertop and capture output
  output=$(sudo powertop --time=10 | grep "Power est." | tail -n 1)

  # Extract average power consumption (Watts)
  consumption=$(echo "$output" | awk '{print $3}' | sed 's/W//')

  if [[ -z "$consumption" ]]; then
    echo "Error: Unable to get power consumption data."
    exit 1
  fi

  echo "$consumption"
}

# Function to calculate power consumption per hour
calculate_per_hour() {
  consumption=$1
  consumption_per_hour=$(echo "$consumption * 3600" | bc)
  echo "Estimated power consumption per hour: $consumption_per_hour W"
}

# Function to find the process using the most CPU or memory
get_top_process() {
  echo "Finding the process with the highest CPU usage..."
  top_process=$(ps aux --sort=-%cpu | head -n 2 | tail -n 1)
  echo "Process consuming the most CPU: $top_process"

  echo "Finding the process with the highest memory usage..."
  top_mem_process=$(ps aux --sort=-%mem | head -n 2 | tail -n 1)
  echo "Process consuming the most Memory: $top_mem_process"
}

# Get power consumption
power_consumption=$(get_power_consumption)

# Calculate the estimated power consumption per hour
calculate_per_hour "$power_consumption"

# Get the most resource-intensive process
get_top_process
