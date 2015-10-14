FROM ubuntu:vivid
MAINTAINER Kingdon Barrett <yebyen@gmail.com>

RUN \
    sed -i 's/vivid universe$/vivid universe multiverse/g' /etc/apt/sources.list && \
    sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y snmpd snmp-mibs-downloader && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY container-files /

ENV SERVER_IP=129.21.49.95 LOCATION=CSH ADMIN_EMAIL=yebyen@gmail.com

EXPOSE 161/udp

ENTRYPOINT ["/bootstrap.sh"]
