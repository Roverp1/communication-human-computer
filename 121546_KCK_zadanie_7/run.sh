#!/usr/bin/env bash
# Run the Color Changer application with Tkinter support

echo "Starting Color Changer Application..."
echo "This will open a GUI window."
echo ""

nix-shell -p python3Packages.tkinter --run "python3 color_changer.py"
