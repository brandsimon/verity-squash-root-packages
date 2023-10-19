#!/usr/bin/env bash
set -e
chown build:build -R /tmp/build
. /tmp/build/aur/PKGBUILD
pacman -Syu --noconfirm \
	"${depends[@]}" "${makedepends[@]}" "${checkdepends[@]}"
sudo -u build bash -c 'cd /tmp/build/aur ; makepkg'
