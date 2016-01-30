#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password toor'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password toor'
sudo apt-get install -y git python-pip libpython-dev libffi-dev \
  libssl-dev mysql-server libmysqlclient-dev python-dev build-essential

sudo reboot
