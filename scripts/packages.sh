#!/bin/bash -e

sudo rm -rf /var/lib/apt/lists/*
sudo apt-get -y install linux-headers-$(uname -r)
sudo apt-get update --fix-missing


sudo apt-get -y install build-essential zlib1g-dev libreadline-dev libssl-dev g++ bundler curl git htop  mysql-client-5.6 libcurl3 libcurl3-gnutls libcurl4-openssl-dev liblzma-dev zlib1g-dev libmysqlclient-dev libsqlite3-dev nodejs nodejs-legacy npm debconf-utils

sudo -u ubuntu  wget 'http://s3-ap-southeast-1.amazonaws.com/st-back-up/ruby-2.0.0-p247.tar.gz'
echo "Downloading ruby from s3..... \n  Please wait ......"
sudo -u ubuntu /bin/tar -xvf ruby-2.0.0-p247.tar.gz
sudo chown ubuntu:ubuntu -R ruby-2.0.0-p247/
cd ruby-2.0.0-p247
sudo -u ubuntu ./configure
sudo -u ubuntu  make
sudo -u ubuntu make test
sudo make install
sudo /usr/bin/npm install pm2 -g

dbpass="admin"
export DEBIAN_FRONTEND=noninteractive
echo mysql-server-5.6 mysql-server/root_password password $dbpass | debconf-set-selections
echo mysql-server-5.6 mysql-server/root_password_again password $dbpass | debconf-set-selections
apt-get -y install mysql-server-5.6

cd /home/ubuntu/

wget https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/10.04/x86_64/chef_12.4.3-1_amd64.deb
sudo /usr/bin/dpkg --install chef_12.4.3-1_amd64.deb
