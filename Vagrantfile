$script_common = <<SCRIPT
  echo "192.168.250.10 debian" >> /etc/hosts
  echo "192.168.250.11 centos" >> /etc/hosts
  echo "192.168.250.12 ubuntu" >> /etc/hosts
  echo "  ForwardAgent yes" >> /etc/ssh/ssh_config
  echo "  StrictHostKeyChecking no" >> /etc/ssh/ssh_config
  echo "  UserKnownHostsFile=/dev/null" >> /etc/ssh/ssh_config
SCRIPT

$script_docker = <<SCRIPT
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  apt-get update
  apt-get install -y docker-ce
  docker run --name percona --restart always -e MYSQL_ROOT_PASSWORD=my-secret-pw-d percona:latest
  usermod -aG docker vagrant
SCRIPT

Vagrant.configure("2") do |config|
  config.ssh.forward_agent = true
  config.ssh.insert_key = false

  config.vm.define "debian" do |subconfig|
    subconfig.vm.box = "debian/jessie64"
    subconfig.vm.hostname = "debian"
    subconfig.vm.network :private_network, ip: "192.168.250.10"
    subconfig.vm.provision "shell", inline: $script_common
  end

  config.vm.define "centos" do |subconfig|
    subconfig.vm.box = "centos/7"
    subconfig.vm.hostname = "centos"
    subconfig.vm.network :private_network, ip: "192.168.250.11"
    subconfig.vm.provision "shell", inline: $script_common
  end

  config.vm.define "ubuntu" do |subconfig|
    subconfig.vm.box = "ubuntu/xenial64"
    subconfig.vm.hostname = "ubuntu"
    subconfig.vm.network :private_network, ip: "192.168.250.12"
    subconfig.vm.provision "shell", inline: "#{$script_common}#{$script_docker}"
  end
end
