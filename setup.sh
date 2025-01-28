#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Install Homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Add Homebrew to PATH if not already added
if ! command -v brew &> /dev/null; then
    echo 'Adding Homebrew to PATH...'
    echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
    source ~/.zshrc
    echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.bash_profile
    source ~/.bash_profile
fi

# Install Ansible
echo "Installing Ansible..."
brew install ansible

# Confirm installations
echo "Confirming installations..."
echo "Homebrew version: $(brew --version)"
echo "Ansible version: $(ansible --version)"

echo "Setup completed successfully!"
