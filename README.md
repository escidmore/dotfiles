# Evelyn's dotfiles
Much of this was shamelessly borrowed (with permission) from https://github.com/kkragenbrink/dotfiles

## Installation
You can clone the repository wherever you want. (I like to keep it in ```~/repos/dotfiles```.)  The bootstrapper script will pull in the latest version and copy the files to your home folder.

```
git clone https://github.com/escidmore/dotfiles.git && cd dotfiles && ./bootstrap.sh
```

To update, ```cd``` into your local ```dotfiles``` repository and then:

```
./boostrap.sh
```

Alternatively to update without a confirmation prompt:

```
./bootstrap.sh -f
```

### Git-free install
To install these dotfiles without Git (or bash-git-prompt):
```
cd; curl -#L https://github.com/escidmore/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh};
```
To update later on, just run that command again.
