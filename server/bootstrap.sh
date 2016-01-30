#!/usr/bin/env bash

echo "apt-get update"
sudo apt-get update > /dev/null
echo "apt-get dist-upgrade"
sudo apt-get -y dist-upgrade > /dev/null
echo "apt-get autoremove"
sudo apt-get -y autoremove > /dev/null

echo "mysql headless install (password is 'toor')"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password toor'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password toor'

echo "apt-get install git python-pip libpython-dev libffi-dev libssl-dev mysql-server libmysqlclient-dev python-dev build-essential"
sudo apt-get install -y git python-pip libpython-dev libffi-dev \
  libssl-dev mysql-server libmysqlclient-dev python-dev \
  build-essential > /dev/null

echo "see you soon"
sudo reboot
