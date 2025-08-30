#!/bin/bash

pacman -Qqe > pacman.txt
pacman -Qqm > yay.txt

echo "Package list updated."
