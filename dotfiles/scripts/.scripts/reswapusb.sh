#/bin/bash
sudo echo 'win10 detach 04d9:0143' | socat - UNIX-CONNECT:/var/run/vm-usbserver.sock
sudo echo 'win10 detach 1e7d:2d60' | socat - UNIX-CONNECT:/var/run/vm-usbserver.sock
sudo echo 'win10 detach 1e7d:2d5f' | socat - UNIX-CONNECT:/var/run/vm-usbserver.sock
