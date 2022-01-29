 swaymsg create_output
 swaymsg output "HEADLESS-1" resolution 1920x1080
 systemctl --user restart pipewire pipewire-media-session.service xdg-desktop-portal xdg-desktop-portal-wlr.service pipewire.socket
 wayvnc -o "HEADLESS-1" localhost &
 vncviewer localhost
