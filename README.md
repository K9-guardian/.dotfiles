# Dotfiles

Usage: 
First import `private.gpg` for `git-crypt` - used for `rclone.conf`.
```
sudo dnf install git git-crypt -y
git-crypt unlock

sudo dnf install stow -y
stow --dotfiles .

./install # TODO: Automate choices for rust and haskell

# disable neovim plugins for new install
mv ~/.config/nvim/after ~/.config/nvim/after.disabled

# make spooldir for local anacron
mkdir -p ~/.local/var/spool/anacron
```
