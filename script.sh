#!/bin/bash

# Update package lists
sudo apt update

# Install required packages
sudo apt install -y libopencv-dev python3-opencv wget gpg

# Download Microsoft GPG key
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg

# Install the GPG key
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

# Add Visual Studio Code repository
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

# Clean up downloaded GPG key
rm -f packages.microsoft.gpg

# Install additional packages
sudo apt install -y apt-transport-https code

# Update package lists again
sudo apt update

# Install Python3 pip
sudo apt install -y python3-pip
