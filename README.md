# AUR-builder
This is an AUR build repository relying on GitHub Actions.

> [!WARNING]
> This is an experimental project, use it at your own risk.

## Packages on this repo
- `quickshell-git`
  - status: [![Build status](https://github.com/Trndcquy-3678/AUR-builder/actions/workflows/quickshell-git-builder.yml/badge.svg?branch=main)](https://github.com/Trndcquy-3678/AUR-builder/actions/workflows/quickshell-git-builder.yml)

## How it works
This project uses a GitHub Actions workflow to:
1.  Setup a clean Arch Linux environment.
2.  Install `yay-bin` for AUR access.
3.  Build packages specified in the build matrix.
4.  Upload the built `.pkg.tar.zst` files as artifacts.

## How to add packages
To add a new package to the automatic build list, edit `.github/workflows/quickshell-git-builder.yml` and add the package name to the `matrix.package` list.

## FAQ
### Q: why?
A: I host this just for experimenting, but also for my Asus X453M (yes, that netbook from 2014)
### Q: we have Chaotic AUR already!
A: I don't think they ship `quickshell-git` and some packages I need :) (they clearly not)
