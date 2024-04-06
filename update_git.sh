#/bin/bash

echo "Replacing dotfiles with this computer configuration"

echo ".config file :"
configs=(hypr wofi discord chromium kitty neofetch neowofetch nvim rofi wofi wal waybar Thunar gtk-3.0)

for config in "${configs[@]}"; do
	echo $config
	cp ~/.config/"$config" ./config/ -R
done
