# evilgit

This is a Proof of Concept (PoC) script for backdooring `git` subcommands. 

## Usage

Modify the script to have your own payload, and optionally add '`--global`' to your `git config` commands for a deeper foothold. Then run:

```bash
$ ./backdoor.sh
```

A full writeup can be found [on my website](https://dayt0n.com/articles/git-backdoor).
