#!/bin/bash
# Script - cs407_inital_installs.sh
# Author - Slava Borysyuk
# Date - 09/21/2025
# Description - The purpose of this script is to
# help set up future vms inside of the cs407 proxmox env.
# It updates packages using dnf and installs new ones.

dnf_update ()
{
    sudo dnf update -y
    sudo dnf install man wget netcat telnet rsync
}

dnf_update
