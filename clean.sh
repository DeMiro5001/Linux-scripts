#!/bin/bash
echo "Step 1 : Clean apt local cache"
apt-get clean
echo "Step 2 : Remove old kernels"
apt-get autoremove --purge
echo "Step 3 : Clear systemd journal logs"
journalctl --vacuum-time=30d
echo "Step 4 : Remove unused docker images"
docker image prune -a -f
echo "Step 5 : Removes old revisions of snaps"
#CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu snap list --all | awk '/disabled/{print $1, $3}' |
      while read snapname revision; do
          snap remove "$snapname" --revision="$revision"
      done
echo "Cleaning complete"
