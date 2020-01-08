FROM ubuntu:latest as build

MAINTAINER eHealthAfrica

RUN apt-get update && apt-get install -y \
    gcc python build-essential zlib1g-dev libbz2-dev lbzip2 git wget

RUN mkdir /usr/src/ardb
ARG storage_engine=rocksdb
ENV storage_engine=$storage_engine
RUN git clone -b "0.10" --single-branch --depth 1 https://github.com/yinqiwen/ardb.git /usr/src/ardb
RUN make -C /usr/src/ardb


FROM ubuntu:latest
RUN mkdir /opt/ardb
COPY --from=build /usr/src/ardb/src/ardb-server /opt/ardb
COPY ./start.sh /opt/ardb
COPY ./ardb.conf /opt/ardb
RUN chmod a+x /opt/ardb/start.sh
CMD ["/opt/ardb/start.sh"]
