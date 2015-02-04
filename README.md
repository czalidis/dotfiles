dotfiles
========

Configuration files for vim, git and other tools, stored in my home directory.

## Suggested usage
Clone the repo to your home directory and use the `install.sh` script in order to configure and install everything. Clone as `.dotfiles` if you want to make it hidden.

```
git clone https://github.com/czalidis/dotfiles.git .dotfiles
cd .dotfiles
./install.sh
```

To actually use the configuration files, `install.sh` needs to create symbolic links to the right place.
If your configuration differs take a look at the script and modify it accordingly.


## Adding new vim plugins
This repo uses [Vundle](https://github.com/gmarik/Vundle.vim) as a plugin manager for vim.
That means no more `git submodule` BS!
Find an interesting plugin and just install it, adding a single line in `.vimrc`.
Lets say we want to add (a hypothetical) https://github.com/foo/bar plugin, by just adding the following
in the beginning of our `.vimrc`:
```vim
Plugin 'foo/bar'
```

Then launch vim and run `:PluginInstall`. To update existing plugins run `:PluginUpdate`.

To install from command line: `vim +PluginInstall +qall`

