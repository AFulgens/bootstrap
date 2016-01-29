#!/usr/bin/env bash

sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm

sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y autoremove
sudo apt-get install -y git python-pip libpython-dev libffi-dev \
  libssl-dev mysql libmysqlclient-dev python-dev build-essential vim

mkdir install
cd install

wget https://github.com/tmux/tmux/releases/download/2.0/tmux-2.0.tar.gz
tar xzf tmux-2.0.tar.gz
cd tmux-2.0
./configure
make
sudo make install
cd ..

sudo pip install pusher websocket-client
https://github.com/pusher/pusher-http-python/archive/v1.2.3.tar.gz
tar xzf v1.2.3.tar.gz -C pusherClient
cd pusherClient
sudo python setup.py install

cd

sudo apt-get install -y mysql libmysqlclient-dev python-dev
sudo pip install mysql prettytable numpy

# dotfiles install through rcm missing yet

sudo reboot