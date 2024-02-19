#!/bin/bash

# Known bash-related extensions
extensions=(
  ".sh"
  ".bash"
  ".bashrc"
  ".bash_profile"
  ".bash_logout"
  ".env"
  ".profile"
)

# File to compile the list of extensions
output_file="bash_extensions_list.txt"

# Clear the file or create it if it doesn't exist
> "$output_file"

# Add known extensions to the file
for ext in "${extensions[@]}"; do
  echo "$ext" >> "$output_file"
done

echo "Compiled list of bash script extensions in $output_file"
#Code writen by Chat GPT