#!/bin/bash

# Initialize defaults
export ARDB_CONF=${ARDB_CONF:=/opt/ardb/ardb.conf}
export ARDB_HOME=${ARDB_HOME:=..}
export EXPOSE_PORT=${EXPOSE_PORT:=6379}
export THREADS=${THREADS:=1}
export DAEMONIZE=${DAEMONIZE:=no}
export KEEP_ALIVE=${KEEP_ALIVE:=60}
export LOG_LEVEL=${LOG_LEVEL:=error}
export LOG_FILE=${LOG_FILE:=stdout}
export DATA_DIR=${DATA_DIR:=../data}

# Apply Password if required
if [[ ! -v REDIS_PASSWORD ]]; then
    echo "no password"
    cp $ARDB_CONF ./ardb.tmp
    sed -i "/requirepass/c\#requirepass" ardb.tmp
    cp ./ardb.tmp $ARDB_CONF 
else
    echo "password"
    cp $ARDB_CONF ./ardb.tmp
    sed -i "/requirepass/c\requirepass $REDIS_PASSWORD" ardb.tmp
    cp ./ardb.tmp $ARDB_CONF
fi

# Start Database
/opt/ardb/ardb-server ${ARDB_CONF}
