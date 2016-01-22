#!/bin/bash
# Configure each node in the spark cluster

cat >$SPARK_HOME/conf/spark-env.sh <<CONF
#!/usr/bin/env bash

SPARK_MASTER_IP=192.168.50.10
SPARK_WORKER_CORES=1
SPARK_WORKER_MEMORY=512M
SPARK_WORKER_INSTANCES=2
SPARK_PUBLIC_DNS=$(hostname)
SPARK_LOCAL_IP=$(hostname -I | awk '{print $2}')
CONF
