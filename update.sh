#!/bin/bash

echo "import .zshrc"
cp ~/.zshrc ./

echo "import .bashrc"
cp ~/.bashrc ./	

echo "import .vimrc"
cp ~/.vimrc ./

echo "import .gntrc"
cp ~/.gntrc ./

echo "import .vim/"
cp -R ~/.vim/ .
