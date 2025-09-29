#!/bin/bash

sudo useradd -u 50000 -g 100 -m admin
sudo usermod -aG wheel admin
sudo passwd admin
