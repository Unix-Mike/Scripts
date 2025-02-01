#!/bin/zsh
find . -type f -name config -print| xargs -I{} sh -c 'grep url {}'|awk '{print $3}'
