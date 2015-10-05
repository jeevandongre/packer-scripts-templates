# Packer for Ruby from source and npm nodejs
This repository contains, scripts and templates to use packer and provision a node for ruby based application. Ruby to be installed from the source not using RVM. Also installs other dependencies.

List of few dependencies install 
* mysql-client
* openssl
* git
* nginx
* htop
* g++
* build-essentials
* npm
* nodejs
* curl
* all other development libraries

Using packer :

Download the packer from the this [link](https://dl.bintray.com/mitchellh/packer/packer_0.8.6_linux_amd64.zip)


Check [packer.io](http://packer.io) website to know more about command or just type packer to see the set of instructions provided by packer. 


To build only virtualbox base vm's use the following command :

```
$packer build -only=virtualbox-iso template.json
```

To build AMI use the following command :

```
$packer build -only=amazon-ebs template.json
```


