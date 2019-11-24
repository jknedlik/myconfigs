* {
    border: none;
    border-radius: 0;
    background: transparent;
    opacity: 0.8;
}

window#waybar {
    background: rgba(43, 48, 59, 0.5);
    border-bottom: 3px solid rgba(100, 114, 125, 0.5);
    color: transparent;
    padding: 0 0px;
    background: transparent;
    color: transparent;
    border-bottom: 0px solid transparent;
}

* .hidded {
    opacity: 0.8;
    color: transparent;
}

#workspaces button {
    padding: 0 5px;
    background: transparent;
    color: white;
    border-bottom: 3px solid transparent;
}

#workspaces button.focused {
    background: #64727D;
    border-bottom: 3px solid white;
}

#mode {
    background: #64727D;
    border-bottom: 3px solid white;
}

#clock, #battery, #cpu, #memory, #network, #pulseaudio, #custom-spotify, #tray, #mode {
    padding: 0 10px;
    margin: 0 5px;
}

#clock {
    background-color: #64727D;
}

#battery {
    background-color: #ffffff;
    color: black;
}

#battery.charging {
    color: white;
    background-color: #26A65B;
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: black;
    }
}

#battery.warning:not(.charging) {
    background: #f53c3c;
    color: white;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

#cpu {
    background: #2ecc71;
    color: #000000;
}

#memory {
    background: #9b59b6;
}

#network {
    background: #2980b9;
}

#network.disconnected {
    background: #f53c3c;
}

#pulseaudio {
    background: #f1c40f;
    color: black;
}

#pulseaudio.muted {
    background: #90b1b1;
    color: #2a5c45;
}

#custom-spotify {
    background: #66cc99;
    color: #2a5c45;
}

#tray {
    background-color: #2980b9;
}
