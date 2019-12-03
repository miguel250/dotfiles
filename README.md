# Miguel dotfiles

Using [holman dotfiles](https://github.com/holman/dotfiles),
[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and
[rtomayko](https://github.com/rtomayko/dotfiles) as examples.

#### Dependecies
Fedora
```
sudo yum groupinstall 'Development Tools' && sudo yum install curl file git python-setuptools cmake freetype-devel fontconfig-devel libxcb-devel libxcrypt-compat
```

Debian/Ubuntu
```
sudo apt-get install build-essential curl file git cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
```

MacOS
* Xcode

```
xcode-select --install
```

#### Install dotfiles
```sh
python -c "exec(\"import urllib2\nprint urllib2.urlopen('https://raw.githubusercontent.com/miguel250/dotfiles/master/scripts/install.sh').read()\n\")" | bash
python ~/workspace/dotfiles/scripts/bootstrap --bash
source ~/.bashrc
```

```sh
python3 -c "exec(\"from urllib.request import urlopen\nprint(urlopen('https://raw.githubusercontent.com/miguel250/dotfiles/master/scripts/install.sh').read().decode('utf-8'))\n\")" | bash
python3 ~/workspace/dotfiles/scripts/bootstrap --bash
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

#### Crostini Notes
- make sure `NOPASSWD:` is added to `/etc/sudoer` with visudo to be able to install Homebrew.
