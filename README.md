# Spark Cluster #

## Installation ##

* **Important:** Access to Vagrant Boxes neccesary, request first
* VirtualBox 5.0
* Vagrant 1.7.4 or later
* Free ports 2200, 2201, 2222 (**SSH**), 8080 and 9800 (**HTTP**)
* Check available CPUs and Memory and modify Vagrantfile if necessary


## How to run ##

### Vagrant ###
* **First run:** Execute start.sh script or execute these commands:
1. ```vagrant up --no-provision```
2. ```vagrant provision```
* **Rest of executions:** Run ```vagrant up``` normally
* **Connect:** Run ```vagrant ssh <node_ip>```
* **Stop:** Run ```vagrant halt```
* **Restart:** Run ```vagrant reload```
* **Destroy:** Run destroy.sh script or execute these commands:
1. ```vagrant destroy```
2. ```rm -rf .vagrant```
* If you desire to recreate cluster machines, read **First run** again

**Note:** If you want to access nodes via node name, add them to your hosts file

###Spark Cluster###
See [Running Spark Standalone Cluster](http://spark.apache.org/docs/latest/spark-standalone.html) to see a complete list of options for running cluster