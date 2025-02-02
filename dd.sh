#!/usr/bin/sh
# Enhanced dd command
# Written by Mike Studer Feb 2025
#
# Requires gum package
#
DD="/usr/bin/dd status=progress bs=4M"
IF="input_file"
OF="output_file"
# Print fancy header
gum style \
	--foreground 212 --border-foreground 57 --border double \
	--align center --width 50 --margin "1 1" \
    'Simple dd command interface'
# Now get user input
IF=$(gum input --placeholder "Input File: ")
OF=$(gum input --placeholder "Output File: ")

CMD="$DD if=$IF of=$OF"
gum style \
	--foreground 15 \
	--background 2 \
    --border double \
    --border-foreground 15 \
	--align center --width 80 --margin "1 1" \
    "Command preview: $CMD"
gum confirm && $CMD

