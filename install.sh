#!/bin/bash

echo "install .zshrc"
cp .zshrc ~/.

echo "install .bashrc"
cp .bashrc ~/.	

echo "install .vimrc"
cp .vimrc ~/. 

echo "install .vim/"
cp -R .vim/ ~/.

echo "install .gntrc"
cp .gntrc ~/. 

