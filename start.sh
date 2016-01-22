#!/bin/bash
# Start Vagrant environment.
# Check if vagrant is running for the first time (to provision machines after creation) or startup them.

if [ ! -d ".vagrant" ]; then
	vagrant up --no-provision
	vagrant provision
else
	vagrant up
fi
