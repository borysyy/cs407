#!/bin/bash
# Script - cs407_inital_updater_service.sh
# Author - Slava Borysyuk
# Date - 09/21/2025
# Description - The purpose of this script is to
# help set up future vms inside of the cs407 proxmox env.
# Adds the cs407updater service and timer that 
# runs at 3 am everyday and updates packages.


cs407updater() {

sudo tee /etc/systemd/system/cs407updater.service > /dev/null <<'EOF'
[Unit]
Description=Update yum/dnf packages

[Service]
Type=oneshot
ExecStart=/usr/bin/dnf -y update
EOF

sudo tee /etc/systemd/system/cs407updater.timer > /dev/null <<'EOF'
[Unit]
Description=Run cs407updater daily at 3AM

[Timer]
OnCalendar=*-*-* 03:00:00
Persistent=true

[Install]
WantedBy=timers.target
EOF

    sudo systemctl daemon-reload
    sudo systemctl enable --now /etc/systemd/system/cs407updater.timer
}

cs407updater
