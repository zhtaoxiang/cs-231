# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.provision(:shell, :inline => <<-CMD)
    apt-get update
    apt-get install -y ocaml rlwrap
    echo "#!/bin/bash\nrlwrap /usr/bin/ocaml" > /usr/local/bin/ocaml
    chmod +x /usr/local/bin/ocaml
  CMD
end
