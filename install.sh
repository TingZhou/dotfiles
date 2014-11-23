#!/bin/bash

echo "Removing old .oh-my-zsh ..."
rm -rf ~/.oh-my-zsh
echo "Cloning new .oh-my-zsh ..."
/usr/bin/env git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh || exit 1

echo "Removing old .dotfiles ..."
rm -rf ~/.dotfiles
echo "Cloning new .dotfiles ..."
/usr/bin/env git clone git://github.com/TingZhou/dotfiles.git ~/.dotfiles || exit 1

echo "Installing .dotfiles ..."
rm -vf ~/.zshrc
rm -vf ~/.gitconfig
rm -vf ~/.gitignore
rm -vf ~/.gitattributes
ln -vs ~/.dotfiles/.zshrc.zt ~/.zshrc
ln -vs ~/.dotfiles/.gitconfig.zt ~/.gitconfig
ln -vs ~/.dotfiles/.gitignore ~/.gitignore
ln -vs ~/.dotfiles/.gitattributes ~/.gitattributes

echo "Installing .vim ..."
curl -L https://raw.githubusercontent.com/TingZhou/vim/master/install.sh | sh
