# ~/.profile: excuted by the command interpreter for login shells.                                                                               
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login 
# exists.

# the default umask is set in /etc/profile; for setting hte umask
# for ssh logins, install and configure the libpam-umask package.
umask u=rwx,g=rx,o=

if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Add ~/bin to the $PATH
export PATH="${HOME}/bin:${PATH}"

# Load additional dotfiles:
# * ~/.path can be used to extend $PATH.
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/.{path,prompt,exports,aliases,functions,extra,termcap}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the bash history file, rather than overwriting it.
shopt -s histappend

# Autocorrect typos in path names when using cd
shopt -s cdspell

# Try to put all commands in a multi-line command in one history entry
shopt -s cmdhist

# Enable some Bash 4 features when possible:
shopt -s autocd 2> /dev/null
shopt -s globstar 2> /dev/null

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Extract!
extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "${HOME}/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh
