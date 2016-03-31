Vagrant.configure(2) do |config|
  config.vm.box = "modernIE/w7-ie11"
  config.vm.provider "virtualbox" do |vbox|
    vbox.gui = true
    vbox.memory = "1024"
    vbox.cpus = 2
    vbox.linked_clone = true
  end
  config.vm.provision "shell", inline: <<-SHELL
    iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
  SHELL
end
