#/bin/bash

echo "Replacing dotfiles with this computer configuration"
echo "===================="

echo ".config files :"
configs=(hypr wofi kitty neofetch neowofetch nvim rofi wofi wal waybar Thunar gtk-3.0)
for config in "${configs[@]}"; do
	echo $config
	cp ~/.config/"$config" ./config/ -R
done
echo "===================="

echo "binary files :"
binaries=(neowofetch change_wallpaper)
for binary in "${binaries[@]}"; do
	echo $binary
	cp /usr/bin/"$binary" ./bin/
done
echo "===================="

echo "cache files :"
echo "wal schemes"
cp ~/.cache/wal/schemes ./home_files/cache/wal/ -R
echo "===================="

echo "wallpapers :"
cp ~/Divers/wallpaper ./home_files/ -R
echo "===================="

echo "scripts :"
scripts=(batocera_sshfs ssh_justalternate.fr sshfs_justalternate.fr rollback.sh)
for script in "${scripts[@]}"; do
	echo $script
	cp ~/scripts/"$script" ./home_files/scripts/ -R
done
echo "===================="

echo "sddm..."
sudo cp /usr/share/sddm/themes/poly-hogwarts ./sddm/poly-hogwarts -R
sudo cp /etc/sddm.conf ./sddm/
echo "==================="
