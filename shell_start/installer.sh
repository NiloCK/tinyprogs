#!/bin/bash

# Create directories
mkdir -p ~/bin
mkdir -p ~/.local/share/tinyprogs

# Clone the repository
git clone https://github.com/nilock/tinyprogs.git ~/.local/share/tinyprogs

# Create symlink to the script
ln -sf ~/.local/share/tinyprogs/shell_start/ubuntuStart.sh ~/bin/ubuntuStart.sh

# Make it executable
chmod +x ~/bin/ubuntuStart.sh

# Add ~/bin to PATH if it's not already there
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
    echo "Added ~/bin to PATH. Please restart your terminal or run 'source ~/.bashrc'"
fi

# Install required dependencies
sudo apt-get update
sudo apt-get install -y tmux wmctrl

echo "Installation complete! You can now run 'ubuntuStart.sh'"
