Vagrant.require_version '>= 1.8'

Vagrant.configure(2) do |config|
  config.vm.box = 'ferventcoder/win2012r2-x64-nocm'
  config.vm.communicator = 'winrm'
  config.vm.guest = :windows
  config.vm.provider :virtualbox do |vbox|
    vbox.linked_clone = true if Vagrant::VERSION >= '1.8'
    vbox.cpus = 1
    vbox.gui = true
    vbox.memory = 2048
    vbox.customize ['modifyvm', :id, '--audio', 'none']
    vbox.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
    vbox.customize ['modifyvm', :id, '--draganddrop', 'bidirectional']
    vbox.customize ['modifyvm', :id, '--usb', 'off']
    vbox.customize ['modifyvm', :id, '--vram', 32]
  end
  config.vm.provision 'shell', path: 'provision.ps1', powershell_elevated_interactive: true
end
