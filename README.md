# ARDB
Resource for building ARDB into the docker image [ehealthafrica/ardb](https://hub.docker.com/r/ehealthafrica/ardb)

#### ARDB
ARDB is an implementation of the Redis protocol which uses on-disk rather than in memory persistence.
https://github.com/yinqiwen/ardb

This build implementation uses RocksDB as the storage layer.

The following ARDB options are exposed via environment:
```bash
export ARDB_CONF=${ARDB_CONF:=/opt/ardb/ardb.conf}
export ARDB_HOME=${ARDB_HOME:=..}
export EXPOSE_PORT=${EXPOSE_PORT:=6379}
export THREADS=${THREADS:=1}
export DAEMONIZE=${DAEMONIZE:=no}
export KEEP_ALIVE=${KEEP_ALIVE:=60}
export LOG_LEVEL=${LOG_LEVEL:=error}
export LOG_FILE=${LOG_FILE:=stdout}
export DATA_DIR=${DATA_DIR:=../data}
export REDIS_PASSWORD=${REDIS_PASSWORD:=password}
```

For usage explanation, see `ardb/ardb.conf`

You can mount your own ardb.conf file into the container at $ARDB_CONF to more expressively influence anything not exposed by environment.

To persist storage, mount the $DATA_DIR.
