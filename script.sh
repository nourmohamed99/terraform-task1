#!/bin/bash

sudo yum apt update
sudo yum apt install apache2 -y
sudo systemctl start apache2 
sudo systemctl enable apache2