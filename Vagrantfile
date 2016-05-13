Vagrant.require_version ">= 1.8"

Vagrant.configure(2) do |config|
  config.vm.box = "ferventcoder/win2012r2-x64-nocm"
  config.vm.communicator = "winrm"
  config.vm.guest = :windows
  config.vm.provider :virtualbox do |v, override|
    v.gui = true
    v.memory = 2048
    v.cpus = 1
    v.customize ["modifyvm", :id, "--audio", "none"]
    v.customize ["modifyvm", :id, "--usb", "off"]
    v.linked_clone = true if Vagrant::VERSION >= '1.8.0'
  end
  config.vm.provision "shell", :powershell_elevated_interactive => true, inline: <<-SHELL
    Invoke-Expression ((New-Object system.net.webclient).DownloadString('http://chocolatey.org/installabsolutelatest.ps1'))
  SHELL
end
