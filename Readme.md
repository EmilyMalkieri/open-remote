# open-remote


Simple tool to open your repo's remote in your default browser.

Works for both `https://` and `git@` remotes.

This tool is in a pretty rough state right now, it assumes you pipe stuff into it and it assume you've got `open` installed. (I believe this is a mac-only tool.)

## Usage

```bash
git remote -v | open-remote
git remote get-url origin | open-remote
```

