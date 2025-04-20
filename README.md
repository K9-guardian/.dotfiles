# Dotfiles

Usage: 
First import `private.gpg` for `git-crypt` - used for `rclone.conf`.
```
sudo dnf install git git-crypt -y
git-crypt unlock

sudo dnf install stow -y
stow --dotfiles .

./install # TODO: Automate choices for rust and haskell

# add crontab for backups
crontab k9guardian_crontab
```
