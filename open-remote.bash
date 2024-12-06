#! /usr/bin/env bash
# Open your repository's remote in your default browser.
#
# based on https://superuser.com/a/1531797
# usage: pipe from `git remote -v` or `git remote get-url origin`
# like this:
# 	git remote -v | open-remote
# because we don't execute the command for you, this works with git wrappers like `yadm`
# depends on `open` which I believe only exists on mac

head -n 1 | # in case we have multiple URLs, like from `git remote -v`
cut -w -f2 | # select just the URL; `remote -v` syntax gives us two other fields we don't need
cut -d"@" -f2 | # cut off a `username@` prefix if it exists
sed -r 's/^http(s?):\/\///' | # cut off protocol if it exists, we'll add it in back later and this helps with the next step
sed 's/:/\//' | # for git@domain:repo syntax
sed 's/.git$//' | # leaving this in the URL doesn't break github but might other sites?
awk '{print "https://"$1}' | # aaand done
xargs open
