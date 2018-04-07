# Miguel dotfiles

Using [holman dotfiles](https://github.com/holman/dotfiles),
[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and
[rtomayko](https://github.com/rtomayko/dotfiles) as examples.

#### Dependecies
Fedora
```
sudo yum groupinstall 'Development Tools' && sudo yum install curl file git python-setuptools
```

MacOS
* Xcode

#### Install dotfiles
```sh
 python2 -c "exec(\"import urllib2\nprint urllib2.urlopen('https://raw.githubusercontent.com/miguel250/dotfiles/master/scripts/install.sh').read()\n\")" | bash
~/workspace/dotfiles/scripts/bootstrap --bash
source ~/.bashrc
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
  -i, --install    Don't run */install files
  -o, --overwrite  Overwrite all files
```
#### iterm2
- Enable `Applications in terminal may access clipboard` to use copying with osc52.

#### Configuration Variables
- `WORKSPACE`: working directory. Default: ~/workspace
- `DOTFILES_NO_AUTO_UPDATE`: Don't automatically update dotfiles. Default: true
