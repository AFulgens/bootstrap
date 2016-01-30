#!/usr/bin/env bash

echo "add rcm apt repository"
sudo add-apt-repository ppa:martin-frost/thoughtbot-rcm > /dev/null

echo "apt-get update"
sudo apt-get update > /dev/null
echo "apt-get dist-upgrade"
sudo apt-get -y dist-upgrade > /dev/null
echo "apt-get autoremove"
sudo apt-get -y autoremove > /dev/null

echo "mysql headless install (password is 'toor')"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password toor'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password toor'

echo "apt-get install git python-pip libpython-dev libffi-dev libssl-dev mysql-server libmysqlclient-dev python-dev build-essential vim libevent-dev libncurses-dev"
sudo apt-get install -y git python-pip libpython-dev libffi-dev \
  libssl-dev mysql-server libmysqlclient-dev python-dev \
  build-essential vim libevent-dev libncurses-dev > /dev/null

mkdir bootstrap
cd bootstrap

echo "build TMUX 2.0 from github release"
wget https://github.com/tmux/tmux/releases/download/2.0/tmux-2.0.tar.gz
tar xzf tmux-2.0.tar.gz > /dev/null
cd tmux-2.0
./configure > /dev/null
make > /dev/null
sudo make install > /dev/null
cd ..

echo "build python pusher client 1.2.3 from github release"
sudo pip install pusher websocket-client
https://github.com/pusher/pusher-http-python/archive/v1.2.3.tar.gz
tar xzf v1.2.3.tar.gz -C pusherClient
cd pusherClient
sudo python setup.py install > /dev/null

cd

echo "apt-get install libmysqlclient-dev python-dev"
sudo apt-get install -y libmysqlclient-dev python-dev > /dev/null
echo "pip install mysql prettytable numpy"
sudo pip install mysql prettytable numpy > /dev/null

# dotfiles install through rcm missing yet

echo "see you soon"
sudo reboot