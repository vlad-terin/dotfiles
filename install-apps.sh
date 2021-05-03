#!/usr/bin/env bash
####################################

## Update packages and Upgrade system

sudo pacman -Syu

## Yay ##
echo '###Installing Yay'
sudo pacman -S yay 

## Git ##
echo '###Installing Git...'
yay -S git

## kitty ##
echo '###Installing Kitty...'
yay -S kitty

## neovim-git ##
echo '###Installing Neovim-git...'
yay -S neovim-git

## ranger ##
echo '###Installing ranger...'
yay -S ranger

## ueberzug ##
echo '###Installing ueberzug...'
yay -S ueberzug

## ripgrep ##
echo '###Installing ripgrep...'
yay -S ripgrep

## python-nvim ##
echo '###Installing python-nvim...'
yay -S python-nvim

## neovim-remote ##
echo '###Installing neovim-remote...'
yay -S neovim-remote

## python-pip ##
echo '###Installing python-pip...'
yay -S python-pip

## powertop ##
echo '###Installing python-pip...'
yay -S python-pip

## python-pip ##
echo '###Installing powertop...'
yay -S powertop

echo '### Installing slack'
yay -S slack-desktop

echo '### Installing zoom'
yay -S zoom 
