#!/bin/sh
sudo cryptsetup open /dev/nvme0n1p6 data && echo "Data device decrypted"
sudo mount /dev/mapper/data /srv && echo "Filesystem mounted to /srv"
