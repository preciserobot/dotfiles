# dotfiles

This repo contains my dotfiles for Manjaro-i3 on a MacBook Pro Retina

## CAUTION
Do not clone this repo as your home directory.
It might overwrite/substitute existing configurations
which are essential to the normal fucntioning of your
linux distribution and/or windows manager.

## Kernel
install 4.8 kernel and headers for wifi

# Notes

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

## install infinality with osx font rendering

## USB automounter

# edit screen dpi by setting screen dimaensions
Section "Monitor"
    Identifier             "<default monitor>"
    DisplaySize            429 270    # In millimeters
EndSection
# or use xrandr --dpi 192
