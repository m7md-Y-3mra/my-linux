#!/bin/bash

# Check if on battery or AC power
if acpi -a | grep -q "off-line"; then
  # On battery, reduce CPU frequency
  cpupower frequency-set -d 0.8G -u 1.2G
else
  # On AC, increase CPU frequency
  cpupower frequency-set -d 1.2G -u 2.5G
fi
