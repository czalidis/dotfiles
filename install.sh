#!/bin/sh

dotfiles=$(pwd)

# Clone Vundle first
git clone https://github.com/gmarik/Vundle.vim.git $dotfiles/.vim/bundle/Vundle.vim

# Install all plugins
vim +PluginInstall +qall

# Compile YouCompleteMe
if [ -e $dotfiles/.vim/bundle/YouCompleteMe/install.sh ]
then
  echo "++ Compiling YouCompleteMe!"
  cd $dotfiles/.vim/bundle/YouCompleteMe/
  ./install.sh --clang-completer
fi

# Create symbolic links
cd ~/
ln -s $dotfiles/.vim
ln -s $dotfiles/.vimrc
ln -s $dotfiles/.inputrc
ln -s $dotfiles/.gitconfig
ln -s $dotfiles/.bash_aliases

# Return where we started
cd $dotfiles
echo "++ Installation completed!"
