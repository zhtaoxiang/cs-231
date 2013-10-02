## CS 231

This repository includes the latex and SML coursework assignments assigned for CS 231 at UCLA for Fall 2013.

## Vagrant

If you don't want to install ocaml on your machine you can download and install VirtualBox and [Vagrant](http://vagrantup.com) to automate the setup of a VM. After installing both from the root directory run

```
vagrant up
vagrant provision
vagrant ssh
```

The first command will build the VM and share the project directory with it, the second step will install ocaml, and the third will allow you to enter the VM and run commands. For example, after running `vagrant ssh` on the host you might do the following to test that it works:

```
cd /vagrant; # enter the project directory shared into the VM
ocaml /vagrant/homework/1/hw1.ml

```

## LaTeX

*TODO* List of packages.
