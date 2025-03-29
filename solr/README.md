# Simple Apache Solr server

This project is from Jeff Geerling's Book Ansible for Devops and  aims to make spinning up a simple local Apache Solr environment incredibly quick and easy, and to introduce users to the fast and powerful search engine behind some of the largest document collections on the Internet. 

It will install the following on a Ubuntu 20.04 linux VM:

  - Java
  - Apache Solr

It should take 5-10 minutes to build or rebuild the VM from scratch on a decent broadband connection.

## Quick Start Guide

### 1 - Install dependencies (VirtualBox, Vagrant, Ansible)

  1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
  2. Download and install [Vagrant](http://www.vagrantup.com/downloads.html).
  3. [Mac/Linux only] Install [Ansible](http://docs.ansible.com/intro_installation.html).



### 2 - Build the Virtual Machine

  1. Download this project and put it wherever you want.
  2. Open Terminal, cd to this directory (containing the `Vagrantfile` and this REAMDE file).
  3. Type in `vagrant up`, and let Vagrant do its magic.

Note: *If there are any errors during the course of running `vagrant up`, and it drops you back to your command prompt, just run `vagrant provision` to continue building the VM from where you left off. If there are still errors after doing this a few times, post an issue to this project's issue queue on GitHub with the error.*

### 3 - Configure your host machine to access the VM.

  1. [Edit your hosts file](http://www.rackspace.com/knowledge_center/article/how-do-i-modify-my-hosts-file), adding the line `192.168.66.66  solr.test` so you can connect to the VM.
  2. Open your browser and access [http://solr.test:8983/solr/](http://solr.test:8983/solr).




