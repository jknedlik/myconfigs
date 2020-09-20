#!/bin/bash

HUGEPAGES_NR=11264
oldnr=0

sudo sh -c "echo $HUGEPAGES_NR >/proc/sys/vm/nr_hugepages"
#try 10 times to allocate the memory for vm hugepages via memory pressure
for i in $(seq 10)
do
  sudo sh -c "echo $HUGEPAGES_NR >/proc/sys/vm/nr_hugepages"
  nr=$(cat /proc/sys/vm/nr_hugepages);
  if [ $nr -lt $HUGEPAGES_NR ]
  then
    break
  fi
  sleep 1
done
if [ $nr -lt $HUGEPAGES_NR ]
then
sudo sh -c"echo $oldnr >/proc/sys/vm/nr_hugepages"
echo "could not get enough hugepages"
exit
fi
sudo virsh net-start default
sudo chown root:kvm /dev/nvme0n1
sudo virsh start win10
sudo systemctl stop usbserver.socket usbserver.service || true
sleep 1
sudo systemctl start usbserver.socket usbserver.service || true
LIBASOUND_DEBUG=1 scream -o pulseaudio -i virbr0 -v -u -p 4011 &>/tmp/scream.log &
looking-glass-client app:renderer=opengl opengl:vsync=yes spice:enable=no  -F -k 1>/tmp/looking-glass-log 2>/tmp/looking-glass-log & 
sudo systemctl start sshd
sudo swapusb.sh

