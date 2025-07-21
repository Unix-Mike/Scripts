#!/bin/zsh
gum style \
	--foreground 212 --border-foreground 57 --border double \
	--align center --width 50 --margin "0" --padding "0" \
    'Git repo locator'
echo ""
let gr=0
let ngr=0
while read -r file; do
#    echo ""
    if [ -f "$file/.git/config" ]; then
         let gr=gr+1
         Origin=$(cd $file;git remote get-url origin)
         Repo=$(echo $file |sed 's/\.\///g')
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
         echo ""
    else
        let ngr=ngr+1
    fi
done < <(find . -type d -maxdepth 1 -mindepth 1 -print)

gum style \
	--foreground 212 --border-foreground 57 --border double \
	--align center --width 50 --margin "1" --padding "1" \
    "Git repos found was $gr." "Non Git repos found was $ngr."
