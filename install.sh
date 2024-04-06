#/bin/bash

echo "Installing dotfiles..."
echo "===================="

echo "config..."
config=./config/*
for f in $config; do
	cp $f ~/.config/ -Rf
done
echo "===================="

echo "bin..."
bins=./bin/*
for f in $bins; do
	sudo cp $f /usr/bin
done
echo "===================="

echo "cache..."
echo "wal schemes"
cp ./home_files/cache/wal/schemes ~/.cache/wal/ -R
echo "===================="

echo "wallpapers..."
cp ./home_files/wallpaper ~/Divers/ -R
echo "===================="

echo "scripts..."
cp ./home_files/scripts/ ~/ -R
echo "===================="

echo "sddm..."
sudo cp ./sddm/poly-hogwarts /usr/share/sddm/themes -R
sudo cp ./sddm/sddm.conf /etc/
echo "==================="
