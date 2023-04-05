#!/usr/bin/awk BEGIN{a=ARGV[1];sub(/[a-z_.-]+$/,"../bin/py2-py3",a);system(a"\t"ARGV[1]"\t"ARGV[2])}

from __future__ import print_function
from __future__ import unicode_literals


import os
import platform
from subprocess import call, Popen, PIPE
import json

OS = platform.system()
CURRENTPATH = os.path.dirname(os.path.realpath(__file__))
DOTFILEDIR = os.path.realpath('%s/../' % CURRENTPATH)

BREW_MAC_URL = 'https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh'
BREW_LINUX_URL = 'https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh'

def install_brew():
    url = None
    command = ""
    if OS == 'Darwin':
        path = None
        if path is None:
            print("Homebrew Needs sudo. Run: ")
            print('/bin/bash -c "$(curl -fsSL %s)"' % BREW_MAC_URL)
            print('Then rerun "./script/install.sh"')
            exit(1)
    elif OS == 'Linux':
        url = BREW_LINUX_URL
        command = 'sh -c "$(curl -fsSL %s)" </dev/null' % url
        path = get_brew_path()
        if path is None:
            print('Installing Homebrew for you.')
            os.system(command)
            return
        else:
            print("Brew already installed")
            return

    print("Skipping installing brew")

def get_brew_path():
    process =  Popen('which brew', stdout=PIPE, stderr=PIPE,  shell=True)
    brew_path = process.communicate()[0].decode('utf8').strip("\n")

    if brew_path == "":
        return None

    return brew_path

if __name__ == '__main__':
    install_brew()

    path = get_brew_path()
    if path is not None and os.path.exists(path) is True:
        print('Installing brew packages')
        os.system("brew update")

        packagePath = os.path.join(DOTFILEDIR, "config.json")
        f = open(packagePath, 'r')

        config = json.loads(f.read())

        brew_os_config = "linux"
        if OS == 'Darwin':
            brew_os_config = "mac"

        brew_os_specific =  config["brew"].get(brew_os_config, {})
        packages = config["brew"]["packages"] + brew_os_specific.get("packages", [])

        for tap in brew_os_specific.get("taps", []):
            print('Installing brew tap %s' % tap)
            os.system("brew tap %s" % tap)

        for p in packages:
            # check if packages is installed. If it is upgrade it
            nothing = open(os.devnull, 'w')
            returnCode = call(['brew', 'ls', p], stdout=nothing, stderr=nothing)

            if returnCode == 1:
                os.system("brew install %s" % p)
            else:
                os.system("brew upgrade %s" % p)

            nothing.close()

        for cask in  brew_os_specific.get("casks", []):
            nothing = open(os.devnull, 'w')
            returnCode = call(['brew', 'cask', 'ls', cask], stdout=nothing, stderr=nothing)

            if returnCode == 1:
                os.system("brew install --cask %s" % cask)
            else:
                os.system("brew upgrade --cask %s" % cask)

            nothing.close()
    else:
        print('Failed to find brew binary')
