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
# files are shared in /vagrant from the project directory
ocaml /vagrant/homework/1/hw1.ml

```

## LaTeX

The home work latex files can be automatically watched an built on systems supporting `inotify` and `inotifywait`/`pdflatex` commands as follows:

```
bash bin/watch.sh homework/<assignment number>/homework.tex
```

So far the packages used are

* bcprules
* amsthm
* syntax

The first is in the project the others must be available in the LaTeX distribution used with `pdflatex`.

## Questions

1. Why do we need `isval`? The NormalForm exception seems to be enough.
2. Should we be catching the NormalForm or bubbling it
