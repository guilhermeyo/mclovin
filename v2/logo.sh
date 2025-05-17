#!/bin/bash

# MCLOVIN ASCII Art
read -r -d '' ascii_art <<'EOF'
███╗   ███╗ ██████╗██╗      ██████╗ ██╗   ██╗██╗███╗   ██╗
████╗ ████║██╔════╝██║     ██╔═══██╗██║   ██║██║████╗  ██║
██╔████╔██║██║     ██║     ██║   ██║██║   ██║██║██╔██╗ ██║
██║╚██╔╝██║██║     ██║     ██║   ██║╚██╗ ██╔╝██║██║╚██╗██║
██║ ╚═╝ ██║╚██████╗███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚████║
╚═╝     ╚═╝ ╚═════╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝  ╚═══╝
EOF

# Define a color palette (e.g., shades of blue, magenta, cyan)
colors=(
  '\033[38;5;51m'  # Cornflower Blue
  '\033[38;5;87m'  # DarkSeaGreen1
  '\033[38;5;123m' # LightSlateBlue
  '\033[38;5;159m' # MediumPurple1
  '\033[38;5;195m' # LightCyan1
)

# Split the ASCII art into lines
IFS=$'\n' read -rd '' -a lines <<<"$ascii_art"

# Print each line with the corresponding color
for i in "${!lines[@]}"; do
  color_index=$((i % ${#colors[@]}))
  echo -e "${colors[color_index]}${lines[i]}\033[0m" # Reset color at the end of each line
done
