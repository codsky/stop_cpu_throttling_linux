#!/bin/bash

# Function to show usage
usage() {
    echo "Usage: $0 [-install-packages true|false]"
    exit 1
}

# Default value for the install-packages flag
install_packages=false

# Parse command line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -install-packages)
            if [[ "$2" == "true" ]]; then
                install_packages=true
            elif [[ "$2" == "false" ]]; then
                install_packages=false
            else
                usage
            fi
            shift 2
            ;;
        *)
            usage
            ;;
    esac
done

# If install-packages flag is set to true, install necessary packages
if $install_packages; then
    echo "Installing packages..."
    sudo apt install cpufrequtils msr-tools -y
fi

# Load msr module
sudo modprobe msr

# Read MSR values and get the first line, then subtract 1
first_value=$(sudo rdmsr -a -d 0x1FC | head -n 1)
new_value=$((first_value - 1))

# Write the modified value back to MSR
sudo wrmsr 0x1FC $new_value

# Monitor CPU frequency info every second
watch -n 1 cpufreq-info
