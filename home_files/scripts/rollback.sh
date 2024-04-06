#!/bin/bash
grep -a upgraded /var/log/pacman.log | grep 2024-03-26 > /tmp/rollback.txt
awk '{print $4}' /tmp/rollback.txt > /tmp/lines1;awk '{print $5}' /tmp/rollback.txt | sed 's/(/-/g' > /tmp/lines2
paste /tmp/lines1 /tmp/lines2 > /tmp/lines
tr -d "[:blank:]" < /tmp/lines > /tmp/packages
cd /var/cache/pacman/pkg/
#for i in $(cat /tmp/packages); do sudo pacman --overwrite '*' --noconfirm -U /var/cache/pacman/pkg/"$i"*.zst; done
