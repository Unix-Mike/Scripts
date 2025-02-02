#!/bin/zsh
while read -r file; do
    echo ""
    if [ -f "$file/.git/config" ]; then
         Origin=$(cd $file;git remote get-url origin)
         Repo=$(echo $file |sed 's/\.\///g')
         echo "Repo = $Repo"
         echo "URL = $Origin"
         echo ""
    else
        echo "File does not exist: $file"
    fi
done < <(find . -type d -maxdepth 1 -mindepth 1 -print)
