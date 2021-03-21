#!/bin/bash
HUGEPAGES_NR=11264
SHM_MAX=23622320128
#get old values, try to allocate the memory
oldshmmax=$(cat /proc/sys/kernel/shmmax);
sudo echo $SHM_MAX >/proc/sys/kernel/shmmax
oldnr=$(cat /proc/sys/vm/nr_hugepages);
sudo echo $HUGEPAGES_NR >/proc/sys/vm/nr_hugepages
#try 10 times to allocate the memory for vm hugepages via memory pressure
for i in $(seq 10)
do
  sudo echo $HUGEPAGES_NR >/proc/sys/vm/nr_hugepages
  nr=$(cat /proc/sys/vm/nr_hugepages);
  if [ $nr -lt $HUGEPAGES_NR ]
  then
    break
  fi
  sleep 1
done
if [ $nr -lt $HUGEPAGES_NR ]
then
sudo echo $oldnr >/proc/sys/vm/nr_hugepages
sudo echo $oldshmmax >/proc/sys/kernel/shmmax
exit
fi
sudo virsh net-start default
sudo chown root:kvm /dev/nvme0n1
sudo virsh start win10
sudo systemctl stop usbserver.socket usbserver.service || true
sleep 1
sudo systemctl start usbserver.socket usbserver.service || true
LIBASOUND_DEBUG=1 scream -o alsa -i virbr0 -v -u -p 4011 1>/tmp/scream.log 2>scream.log &
looking-glass-client app:renderer=opengl opengl:vsync=yes spice:enable=no  -F -k 1>/tmp/looking-glass-log 2>/tmp/looking-glass-log & 
sudo systemctl start sshd
sudo swapusb.sh

