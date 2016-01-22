# -*- mode: ruby -*-
# vi: set ft=ruby :

# Constants
VAGRANTFILE_API_VERSION = 2
VAGRANT_DEFAULT_PROVIDER = "virtualbox"
SPARKBOX = "sergiohg/scala-spark"
SCRIPTS_DIR = "scripts/"
PROVISIONER = "shell"

# Provisioning scripts
provision = {
    :privileged => ["cluster_nodes.sh"],
    :no_privileged => ["ssh_copy_keys.sh"]
}

# Nodes specification
# Remember to put each node at cluster_nodes.sh
nodes = [
    {
        :hostname => "spark1",
        :box => SPARKBOX,
        :ip => "192.168.50.10",
        :memory => 2048,
        :ncpus => 2,
        :port_forwarding =>
            {
                8080 => 8080,
                9800 => 9800,
            },
        :provision =>
            {
                :no_privileged => ["spark_master.sh", "spark_conf.sh"],
            }
    },
    {
        :hostname => "spark2",
        :box => SPARKBOX,
        :ip => "192.168.50.11",
        :memory => 2048,
        :ncpus => 2,
        :provision =>
            {
                :no_privileged => ["spark_conf.sh"],
            }
    }
]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Configuration for each node
  nodes.each do |node_data|
    config.vm.define node_data[:hostname] { |node_conf|

      # Choose a box for the virtual machine
      node_conf.vm.box = node_data[:box]

      # Specific configuration for VirtualBox provider
      node_conf.vm.provider VAGRANT_DEFAULT_PROVIDER do |vb|
        vb.name = node_data[:hostname]
        vb.memory = node_data[:memory]
        vb.cpus = node_data[:ncpus]
      end

      # Special configuration for node
      node_conf.vm.hostname = node_data[:hostname]
      node_conf.vm.network :private_network, ip: node_data[:ip]
      node_conf.ssh.insert_key = true
      node_conf.ssh.password = "vagrant"
      if node_data.has_key? :port_forwarding then
        node_data[:port_forwarding].each do |vm_port, host_port|
          node_conf.vm.network "forwarded_port",
                               guest: vm_port,
                               host: host_port
        end
      end

      # Node provisioning
      node_prov = provision
      if node_data.has_key? :provision then
        node_prov = node_prov.merge(node_data[:provision]) { |k, v1, v2|
          v1 + v2
        }
      end
      node_prov.each do |permissions, scripts|
        scripts.each { |s|
          if permissions == :privileged
            node_conf.vm.provision PROVISIONER,
                                   path: SCRIPTS_DIR + s
          else
            node_conf.vm.provision PROVISIONER,
                                   path: SCRIPTS_DIR + s,
                                   privileged: false
          end
        }
      end

      # Node synced folders
      if node_data.has_key? :synced_folder then
        node_data[:synced_folder].each { |folder_data|
          config.vm.synced_folder folder_data[:host_dir],
                                  folder_data[:guess_dir],
                                  create: folder_data[:create],
                                  group: folder_data[:group],
                                  owner: folder_data[:owner]
        }
      end

    }
  end

end
