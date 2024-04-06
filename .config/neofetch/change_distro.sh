#!/bin/bash
distro=$(shuf -n 1 list_all_distro_name | head -1)
last_distro=$(cat last_one)
echo $distro
echo $distro > last_one
sed -i 's/'$last_distro'/'$distro'/g' config.conf
