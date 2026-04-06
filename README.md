# AUR-builder
This is an AUR build repository relying on GitHub Actions.

> [!WARNING]
> This is an experimental project, use it at your own risk.

## Packages on this repo
- `quickshell-git`
  - status: [![Build status](https://github.com/Trndcquy-3678/AUR-builder/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/Trndcquy-3678/AUR-builder/actions/workflows/main.yml)

## Package Builder Workflow
The build process is automated via GitHub Actions and follows these steps:

1.  **Trigger**: The workflow is triggered manually via `workflow_dispatch` or automatically on a daily schedule.
2.  **Orchestration (`main.yml`)**: The main launcher calls specialized package workflows for each target.
3.  **Compilation (`package-<name>.yml`)**: Each package workflow runs in a fresh Arch Linux container.
4.  **Build Execution (`scripts/build.sh`)**:
    - Updates system and installs `base-devel`, `git`, and `sudo`.
    - Creates a non-root `builder` user for secure compilation.
    - Installs `yay-bin` from the AUR.
    - Compiles the target package and its dependencies.
5.  **Artifact Collection**: The resulting `.pkg.tar.zst` files are collected and uploaded as GitHub Action artifacts.

## How to add a new package
To add a new package to this repository:
1.  **Create a workflow**: Copy `.github/workflows/package-quickshell-git.yml` to `.github/workflows/package-<name>.yml` and update the package name.
2.  **Register in Launcher**: Add a new job to `.github/workflows/main.yml` that uses your new workflow:
    ```yaml
    jobs:
      my-new-package:
        uses: ./.github/workflows/package-my-new-package.yml
    ```

## FAQ
### Q: why?
A: I host this just for experimenting, but also for my Asus X453M (yes, that netbook from 2014)
### Q: we have Chaotic AUR already!
A: I don't think they ship `quickshell-git` and some packages I need :) (they clearly not)
