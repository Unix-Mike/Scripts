#!/bin/bash
# Jun 2025 by Mike Studer
# #
# Make sure PNG directory exists in current location
[ -d PNG ]  || mkdir PNG
# Make a standard file extension for jpeg files
find . -type f -name "*.jpeg" -exec bash -c 'mv "$1" "${1%.jpeg}.jpg"' - '{}' \;
# Now convert all jpg to png and put in PNG dir. Retain original jpegs.
for i in *.jpg ; do
    magick "$i" "PNG/${i%.jpg}.png"
done
