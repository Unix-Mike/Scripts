#!/bin/zsh
gum style \
	--foreground 212 --border-foreground 57 --border double \
	--align center --width 50 --margin "1 2" --padding "1 1" \
    'Git repo locator'

while read -r file; do
    echo ""
    if [ -f "$file/.git/config" ]; then
         Origin=$(cd $file;git remote get-url origin)
         Repo=$(echo $file |sed 's/\.\///g')
         #echo "Repo = $Repo"
         #echo "URL = $Origin"
         #echo ""
         echo -n "Repo   = "
         gum style \
            --foreground 10 \
            --align left --width 80 \
            $Repo
         echo -n "Origin = "
         gum style \
            --foreground 11 \
            --align left --width 80 \
            "$Origin"
    else
        gum style \
            --foreground 8 \
            --align left --width 80 \
        "File does not exist: $file"
    fi
done < <(find . -type d -maxdepth 1 -mindepth 1 -print)
