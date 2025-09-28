# Dotfiles for hippocampus

Usage: 
First import `private.gpg` for `git-crypt` - used for `rclone.conf`.
```
sudo dnf install git git-crypt -y
git-crypt unlock

sudo dnf install stow -y
stow --no-folding --dotfiles .

./install

# add crontab for backups
crontab k9_crontab
```
