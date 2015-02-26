# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "phusion/ubuntu-14.04-amd64"

  config.vm.provision "docker", run: "always" do |d|
    d.build_image "/app", args: "-t mkboudreau/docker-present"
    d.run "mkboudreau/docker-present", args: "-p 3999:3999 -v /app:/app"
  end

  config.vm.network "forwarded_port", guest: 3999, host: 3999, autocorrect: true
  config.vm.synced_folder ".", "/app", create: true, group: "vagrant", owner: "vagrant"
end
