# Media Temple DV 4.5 w/ Vagrant

A basic [Media Temple (mt) DV 4.5](http://mediatemple.net/webhosting/vps/managed/) Vagrant setup. The goal for this project
is to setup a development environment that mirrors the (mt) DV production servers. It will be an ongoing project that
aligns with (mt)'s provisioning.

## Requirements

* VirtualBox - Virtualization software [Download Virtualbox](https://www.virtualbox.org/wiki/Downloads)
* Vagrant **1.4+** - Development environments made easy [Download Vagrant](http://www.vagrantup.com/downloads.html)
* Git - Source Control Management [Download Git](http://git-scm.com/downloads)

## Setup

* Clone this repository `git clone https://github.com/weareloring/vagrant-mediatemple-dv-4.5.git`
* `cd vagrant-mediatemple-dv-4.5` and run `vagrant up` (the first time you run `vagrant up` it will need to fetch the
virtual box image which is 769MB so this could take some time. Subsequent runs will only take a minute or so)
* Vagrant will then use [Puppet](http://puppetlabs.com/) to provision a LAMP stack on the box (again, the first run will
take some time but any runs after that will be very quick)
* You can verify that the server is up and running by hitting http://11.11.11.15](http://11.11.11.15) or
[http://localhost:8080](http://localhost:8080) in your browser.

## Usage

Some basic information on vagrant and the development server

### Vagrant

* `vagrant up` starts the virtual machine and provisions it
* `vagrant suspend` will essentially put the machine to 'sleep' with `vagrant resume` waking it back up
* `vagrant halt` attempts a graceful shutdown of the machine and will need to be brought back with `vagrant up`
* `vagrant ssh` gives you shell access to the virtual machine

Visit the [Vagrant website](http://vagrantup.com) for detailed documentation.

### Port Forwards

* 8080 - Apache
* 8081 - MySQL

### Default MySQL Credentials

* User: root
* Password: (blank)

### Development Server Specs

* OS - CentOS 6.4
* Apache - 2.2.15
* PHP - 5.4.23
* MySQL - 5.5.35

#### PHP Modules

* Mcrypt
* PHP CLI
* PDO
* GD
* mbstring
* XML
* PEAR