# Dotfiles

Usage: 
First import keys from backup
```
~/.gnupg
~/.passfiles
~/.password-store
```
Make necessary edits to `install` and run
```
sudo dnf install git git-crypt -y
git-crypt unlock

sudo dnf install stow -y
stow --no-folding --dotfiles .

./install # TODO: Automate choices for rust and haskell

# add crontab for backups
crontab k9guardian_crontab
```
