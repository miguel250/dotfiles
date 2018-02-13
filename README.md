# Miguel dotfiles

Using [holman dotfiles](https://github.com/holman/dotfiles),
[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and
[rtomayko](https://github.com/rtomayko/dotfiles) as examples.

#### Install dotfiles
```sh
scripts/bootstrap
```

```sh
scripts/bootstrap -h
usage: bootstrap [-h] [--backup] [--restore] [--bash] [--name NAME]
                 [--email EMAIL] [-s] [-c] [-i] [-o]

Install dotfiles

optional arguments:
  -h, --help       show this help message and exit
  --backup         Backup files
  --restore        restore to backup file
  --bash           Enable zsh shell via bash
  --name NAME      Name to use for git
  --email EMAIL    Email to use for git
  -s, --link       Don't run install symlink
  -c, --conf       Don't run git configuration
  -i, --install    Don't run dotfiles .install files
  -o, --overwrite  Overwrite all files
```

