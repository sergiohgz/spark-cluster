#!/bin/bash
# Copy SSH keys between machines

# 1. SSH keygen generation
setted=$(find /home/vagrant/.ssh -name "id_rsa*" | wc -l)
if [ $setted -eq 0 ]; then
    cat /dev/zero | ssh-keygen -q -N ""
fi

# 2. SSH keygen copy to other hosts
hosts=$(cat /etc/hosts | grep us | awk '{print $2}' | sort | uniq)
for node in $hosts
do
	sshpass -p 'vagrant' ssh-copy-id vagrant@$node
done
