Packages for verity-squash-root
-------------------------------

This repository creates packages for [verity-squash-root](https://github.com/brandsimon/verity-squash-root).
Currently supported is Debian Bookworm.

## Release

To release a new version, follow these steps:

- Create a new release of verity-squash-root
- Update the PKGBUILD in the Arch User Repository
- Update the verity-squash-root and aur submodule
- Update the debian changelog
- Create a new tag, e.g. `v0.3.0`
- Create the release immediately after `git push --tags`. Otherwise
the build scripts cannot upload the release assets.
