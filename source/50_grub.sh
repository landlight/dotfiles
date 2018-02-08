function backup_grub() {
  sudo rm ~/.dotfiles/config/grub-backup
  sudo cp -n /etc/default/grub ~/.dotfiles/config/grub/backup
}

function set_grub() {
  sudo rm /etc/default/grub
  sudo cp -n $1 /etc/default/grub
  sudo update-grub
  sudo reboot
}

function restore_grub() {
  set_grub ~/.dotfiles/config/grub/backup
}

function set_grub_default() {
  set_grub ~/.dotfiles/config/grub/default
}

function set_grub_minimal() {
  set_grub ~/.dotfiles/config/grub/minimal
}
