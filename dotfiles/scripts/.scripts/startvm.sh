#!/bin/bash

echo "do you want me to start the lookgin glass client?[y/N]"
read -n1 ask
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
	LIBASOUND_DEBUG=1 scream -o pulseaudio -i virbr0 -v -u -p 4011 &>/tmp/scream.log &
	if [ "$ask" = "y" ]; then
		looking-glass-client spice:enable=no  -F -k 1>/tmp/looking-glass-log 2>/tmp/looking-glass-log & 
	fi	
	sudo systemctl start sshd
	exit
  fi
  sleep 1
done
sudo sh -c "echo 0 >/proc/sys/vm/nr_hugepages"
echo "could not get enough hugepages"
exit


