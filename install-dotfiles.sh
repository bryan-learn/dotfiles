#!/bin/bash
############################
# install.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vim vimrc screenrc-ide"    # list of files/folders to symlink in homedir

##########

# create backup dir for conflicting dotfiles
echo "Creating $olddir for backup of any existing dotfiles in ~/"
mkdir -p $olddir

# create dotfiles directory for new dotfiles
echo "Creating $dir for new dotfiles: $files"
mkdir -p $dir

# for each file
#   move conflicting dotfile to $olddir
#   copy file to $dir
#   symlink file to ~/
for file in $files; do
    echo "Moving any existing $file from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Copying new $file to $dir"
    cp -r ./$file $dir/$file
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
