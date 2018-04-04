# dotfiles

This repo contains my dotfiles for Manjaro-i3.
The current version is adapted to the 6th gen ThinkPad X1 Carbon (WQHD).

## CAUTION
Do not clone this repo as your home directory.
It might overwrite/substitute existing configurations
which are essential to the normal fucntioning of your
linux distribution and/or windows manager.

# Notes

## S3 support
see https://delta-xi.net/#506 or the INSTALL file

## add server to pacman
echo "XYZ" >> /etc/pacman.conf

## adding keys to pacman
pacman-key -r keyid (RECEIVE KEY)
pacman-key -f keyid (VERIFY FINGERPRINT)
pacman-key --lsign-key keyid (SIGN KEY LOCALLY)

## sort pacman mirror list by ping
sudo pacman-mirrors -g

## change monitor settings
arandr
save as
add generated xrandr command to i3config
