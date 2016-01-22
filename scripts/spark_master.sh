#!/bin/bash
# Create the Spark Master node configuration.

cat >/opt/spark/conf/slaves <<WORKERS
spark1
spark2
WORKERS

cp /opt/spark/conf/log4j.properties.template /opt/spark/conf/log4j.properties
sed -i -e 's/log4j.rootCategory=INFO/log4j.rootCategory=WARN/g' \
 /opt/spark/conf/log4j.properties
