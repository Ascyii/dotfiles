# Jonas dotfiles

This repo works well with `stow`. When the binary is present the dotfiles can be installed with `stow <package>` from the root directory of the project.
When there are conflicts the resolve script can be used with care. It can be used the same way `stow` does by providing a package name.
When `stow` is run with the dotfiles flag then the prefix is parsed and replaced. Be careful that there still exist dotfiles in this repo.

Be sure to only use the `stow.sh` wrapper scripts as this sets some defaults.

## Additional

Setup `rlone` host `Strato` for the automatic webdav mounting to work.
