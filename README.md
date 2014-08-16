homedir
=======

Configuration files for vim, git and other tools, stored in my home directory.

## Suggested use 
Clone the repo to your home directory and fetch various plugins using `git submodule`. Clone as `.homedir` if you want to make it hidden.

```
git clone https://github.com/czalidis/homedir.git .homedir
cd .homedir
git submodule init
git submodule update
```

To actually use the configuration files, you can create a symbolic link to the right place. For example to configure vim properly:
```
cd ~
ln -s .homedir/.vimrc
ln -s .homedir/.vim
```

## Adding new vim plugins
Find a git repo of the desired plugin and add it using `git submodule`. Lets say we want to add (a hypothetical) https://github.com/foo/bar plugin:
```
cd ~/.homedir
git submodule add https://github.com/foo/bar .vim/bundle/bar
git commit -m 'Add new plugin for vim, bar'
```
