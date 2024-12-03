#!/bin/bash

# Create directories
mkdir -p ~/bin
mkdir -p ~/.local/share/tinyprogs
mkdir -p ~/.local/share/applications

# Clone the repository
git clone https://github.com/nilock/tinyprogs.git ~/.local/share/tinyprogs

# Create symlink to the script
ln -sf ~/.local/share/tinyprogs/shell_start/ubuntuStart.sh ~/bin/ubuntuStart.sh

# Make it executable
chmod +x ~/bin/ubuntuStart.sh

# Create desktop entry
cat > ~/.local/share/applications/ubuntuStart.desktop << EOF
[Desktop Entry]
Name=Tmux Workspace
Comment=Launch tmux workspace in terminal
Exec=${HOME}/bin/ubuntuStart.sh
Terminal=false
Type=Application
Categories=Utility;TerminalEmulator;
Icon=utilities-terminal
EOF

# Add ~/bin to PATH if it's not already there
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
    echo "Added ~/bin to PATH. Please restart your terminal or run 'source ~/.bashrc'"
fi

# Install required dependencies
sudo apt-get update
sudo apt-get install -y tmux wmctrl

# Update desktop database
update-desktop-database ~/.local/share/applications

echo "Installation complete! You can now run 'ubuntuStart.sh' or find 'Terminal Workspace' in your applications"
