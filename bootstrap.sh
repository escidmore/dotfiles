#!/bin/bash
cd "$(dirname "$0")"
git pull

function install() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    install
	git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        install
    fi
	read -p "Install bash-git-prompt? (y/n) " -n 1
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
	fi
fi

unset install
source ~/.profile