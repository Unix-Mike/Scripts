#!/usr/bin/sh
gum style \
	--foreground 212 --border-foreground 57 --border double \
	--align center --width 50 --margin "1 2" --padding "1 1" \
    'Simple gum interface'

for C in {0..15}
do
    gum style \
	--foreground $C \
	--background 0 \
	--align left --width 20 \
    "Color: $C"
done
