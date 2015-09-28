#! /bin/bash -e
sudo rm -rf /var/lib/apt/lists/*
sudo apt-get -y install linux-headers-$(uname -r)
sudo apt-get update --fix-missing


##Installs basic packages for ubuntu 14.04
export DEBIAN_FRONTEND=noninteractive
sudo apt-get -q -y install mysql-server

sudo apt-get -y install build-essential zlib1g-dev libreadline-dev libssl-dev g++ bundler curl git htop  mysql-client libcurl3 libcurl3-gnutls libcurl4-openssl-dev liblzma-dev zlib1g-dev libmysqlclient-dev libsqlite3-dev nodejs nodejs-legacy npm debconf-utils

##Installs ruby 2.0.0-p247 Please change the Url if you want to install another version of ruby
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

