#!/bin/bash
# Create the Spark Master node configuration.

cat >$SPARK_HOME/conf/slaves <<WORKERS
spark1
spark2
WORKERS

cp $SPARK_HOME/conf/log4j.properties.template $SPARK_HOME/conf/log4j.properties
sed -i -e 's/log4j.rootCategory=INFO/log4j.rootCategory=WARN/g' \
 $SPARK_HOME/conf/log4j.properties
