#!/bin/bash
# Append to hosts all nodes in the cluster.
# Syntax explain:
# cat >>filename -> append to file
# <<delimiter_name -> start a multiline text
# delimiter_name -> end of multiline text

my_hostname=$(hostname)
setted=$(cat /etc/hosts | grep us | grep -v $my_hostname | wc -l)

# Checks if other hosts are setted in hosts and put them if not
if [ ! $setted -gt 0 ]; then

	cat >>/etc/hosts <<NEW_HOSTS
192.168.50.10  spark1
192.168.50.11  spark2
NEW_HOSTS

fi
