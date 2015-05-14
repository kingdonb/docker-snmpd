FROM ubuntu:vivid
MAINTAINER Kingdon Barrett <kbarrett@metrixmatrix.com>

RUN \
    sed -i 's/vivid universe$/vivid universe multiverse/g' /etc/apt/sources.list && \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y snmpd snmp-mibs-downloader && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY container-files /

ENV SERVER_IP=192.168.40.33 LOCATION=Office ADMIN_EMAIL=admin@metrixmatrix.com

EXPOSE 161/udp

ENTRYPOINT ["/bootstrap.sh"]