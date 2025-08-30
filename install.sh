#!/bin/bash
set -e

PACMAN_FILE="$HOME/dotfiles/pacman.txt"
YAY_FILE="$HOME/dotfiles/yay.txt"

echo "[*] Updating system..."
sudo pacman -Syu --noconfirm

# pacman packages
if [ -f "$PACMAN_FILE" ]; then
  echo "[*] Installing pacman packages..."
  sudo pacman -S --needed --noconfirm $(<"$PACMAN_FILE")
else
  echo "⚠️ No pacman.txt found, skipping."
fi

# Installing yay
if ! command -v yay >/dev/null 2>&1; then
  echo "[*] yay not found, installing..."
  sudo pacman -S --needed --noconfirm base-devel git
  tmpdir=$(mktemp -d)
  git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
  cd "$tmpdir/yay"
  makepkg -si --noconfirm
  cd -
  rm -rf "$tmpdir"
else
  echo "[*] yay already installed."
fi

# AUR packages
if [ -f "$YAY_FILE" ]; then
  echo "[*] Installing AUR packages..."
  yay -S --needed --noconfirm $(<"$YAY_FILE")
else
  echo "⚠️ No yay.txt found, skipping."
fi

# NOTE: Installing font
FOND_DIR="$HOME/.local/share/fonts"
MAPLE_DIR="$FONT_DIR/MapleMono"

if [ ! -d "$MAPLE_DIR" ]; then
  echo "[*] Installing Maple Mono font..."
  mkdir -p "$FOND_DIR"
  tmpdir=$(mktemp -d)
  git clone --depth=1  https://github.com/subframe7536/maple-font.git "$tmpdir/maple-font"
  cp -r "$tmpdir/maple-font/fonts/ttf" "$MAPLE_DIR"
  rm -rf "$tmpdir"
  fc-cache -fv > /dev/null
  echo " -> Maple Mono installed."
else
  echo " -> Maple Mono is already installed."
fi

echo "[*] Setting up dotfiles..."
if [ -d "$HOME/dotfiles" ]; then
  cd "$HOME/dotfiles"
  for dir in */; do
    stow "$dir"
  done
else
  echo "⚠️ dotfiles dir not found."
fi

echo "✅ All done."

