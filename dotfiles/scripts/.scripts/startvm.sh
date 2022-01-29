#!/bin/bash

HUGEPAGES_NR=8600
oldnr=0
sudo sh -c "echo $HUGEPAGES_NR >/proc/sys/vm/nr_hugepages"
#try 10 times to allocate the memory for vm hugepages via memory pressure
for i in $(seq 8)
do
  sudo sh -c "echo $HUGEPAGES_NR >/proc/sys/vm/nr_hugepages"
  nr=$(cat /proc/sys/vm/nr_hugepages);
  if [ $nr -ge $HUGEPAGES_NR ];
  then # if done boot the vm
	sudo virsh net-start default &
	sudo chown root:kvm /dev/nvme0n1
	sudo virsh start win10 
	sudo systemctl stop usbserver.socket usbserver.service || true
	sleep 0.5 
	sudo systemctl start usbserver.socket usbserver.service || true
	sudo -u jknedlik DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u jknedlik)/bus systemctl --user start liba
	sudo systemctl start sshd
	exit
  fi
  sleep 1
done
sudo sh -c "echo 0 >/proc/sys/vm/nr_hugepages"
echo "could not get enough hugepages"
exit


