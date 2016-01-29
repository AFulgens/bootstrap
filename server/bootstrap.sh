#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get install -y git python-pip libpython-dev libffi-dev \
  libssl-dev mysql libmysqlclient-dev python-dev build-essential
sudo reboot
