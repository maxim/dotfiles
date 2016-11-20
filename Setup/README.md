# Setup of new Mac

## Set keyboard preferences

1. Remap Caps Lock to Ctrl in Keyboard.pref
2. Add Russian to Input Sources in Keyboard.pref
3. Remap Shortcut for switching language to Cmd+Space
4. Remap Shortcut for showing Spotlight to Caps Lock+Space

## Setup Ansible and OSX defaults

1. First install XCode Command Line Tools appropriate for MacOS version: https://developer.apple.com/downloads/

2. Run this in the Terminal:

```
cd ~
git clone https://github.com/maxim/dotfiles.git
cp -r dotfiles/. ./
rm -rf dotfiles
cd ~/Setup
./setup.sh
./macos.sh
```

3. Restart the mac

## Setup software

1. Open terminal, and run this:

```
cd ~/Setup
ansible-playbook setup.yml -i inv -K
```

### Setup ODrive

External folders: `Unsorted`, `Documents`, `Downloads`

1. Login to ODrive via Google (the splash screen is probably open)
2. In Finder go to /Users/max
3. Right click Downloads and sync folder to `Box/Downloads`
4. Right click Documents and sync folder to `Google Drive/Documents`
5. Right click Documents and Sync everything (Include subfolders + Save)
6. Make folder on Desktop: Unsorted, and sync to `Google Drive/Desktop/Unsorted`

### Install Mac App Store apps

Go to "Purchased" and install these:

- 1password
- acorn
- slack
- night owl
- fleep
- omnifocus
- the unarchiver

### Install Sublime Text

Install latest dev version manually.

### Configure software

(Follow the install order and common sense)

### Setup Ruby

Run `ruby-install ruby 2.3.2` (change version to whatever you want)

## Setup ssh keys

1. Old computer: `cd ~ && zip -r ssh.zip .ssh`
2. Old computer: Move to iCloud
3. New computer: Move from iCloud, extract and delete archive
4. `rm ssh.zip`
5. `ssh-add ~/.ssh/id_rsa`
6. `ssh-add ~/.ssh/id_dsa`

## Setup ZSH

1. Open terminal, run this:

```
cd ~/
git submodule update --init --recursive
```

2. Open Users & Groups
3. Right click your user
4. Go to Advanced Options
5. Change "Login shell" to /usr/local/bin/zsh

### Move ZSH history

1. Old computer: `cd ~ && cp .zsh_history zsh_history`
2. Old computer: Move zsh_history to iCloud
3. New computer: Move zsh_history from iCloud
4. New computer: `cd ~ && cp zsh_history .zsh_history`

### Move secrets

1. Old computer: `cd ~ && zip -r secrets.zip .secrets`
2. Old computer: move secrets.zip to iCloud
3. New computer: move secrets.zip from iCloud, extract, and delete archive

## Transfer via USB

1. Transfer fonts
2. Transfer Desktop stuff
3. Transfer System stuff
4. Transfer /etc/hosts
5. Transfer dev projects via uncompressed tarball

## Dev projects

1. Use `tar-search` and `tar-extract` from Binaries to extract tar as needed
2. Once blog is setup, map posts dir to odrive's Dropbox/Blog

## Misc

1. Remove everything from Dock
2. Setup Gmail accounts in Accounts
3. Setup iTunes Music (Cloud)
4. Setup Photos
5. Configure iTerm
6. Configure Sublime Text
