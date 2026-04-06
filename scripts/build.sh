#!/bin/bash
set -e

PACKAGE=$1

if [ -z "$PACKAGE" ]; then
  echo "Usage: $0 <package-name>"
  exit 1
fi

echo "Building package: $PACKAGE"

# Setup system
pacman -Syu --noconfirm
pacman -S --noconfirm base-devel git sudo

if ! id "builder" &>/dev/null; then
  useradd -m builder
  echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
fi

# Install yay-bin
su - builder -c '
  if [ ! -d "yay-bin" ]; then
    git clone https://aur.archlinux.org/yay-bin.git
  fi
  cd yay-bin
  makepkg -si --noconfirm
'

# Build the requested package
su - builder -c "yay -S --noconfirm $PACKAGE"

# Collect built packages
mkdir -p /output
find /home/builder/.cache/yay/ -name "*.pkg.tar.zst" -exec cp {} /output/ \;

echo "Build complete for $PACKAGE"
