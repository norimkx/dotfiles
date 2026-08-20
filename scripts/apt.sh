#!/usr/bin/env bash

# Update package lists and upgrade installed packages
sudo apt update && sudo apt upgrade -y

# Install required apt packages
sudo apt install -y build-essential procps curl file git jq nkf tree wget zip
