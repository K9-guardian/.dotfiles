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

# TODO: automate?
# add symlink for nas-perms in /etc/cron.hourly
sudo ln -s ~/.dotfiles/dot-scripts/nas-perms /etc/cron.hourly/nas-perms
# add copy for smbshares.conf in /etc/samba/smbshares.conf
sudo cp ~/.dotfiles/smbshares.conf /etc/samba/smbshares.conf
```
