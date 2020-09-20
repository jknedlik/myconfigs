#/bin/bash
sudo echo 'win10 detach 0b05:18ec' | socat - UNIX-CONNECT:/var/run/vm-usbserver.sock
sudo echo 'win10 detach 0b05:17cb' | socat - UNIX-CONNECT:/var/run/vm-usbserver.sock

sudo echo 'win10 attach 0b05:18ec' | socat - UNIX-CONNECT:/var/run/vm-usbserver.sock
sudo echo 'win10 attach 0b05:17cb' | socat - UNIX-CONNECT:/var/run/vm-usbserver.sock
