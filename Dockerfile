FROM centos:centos7
MAINTAINER Kingdon Barrett <kbarrett@metrixmatrix.com>

RUN \
    yum update -y && \
    yum install -y net-snmp && \
    yum clean all

COPY container-files /

ENV SERVER_IP=192.168.40.33 LOCATION=Office ADMIN_EMAIL=admin@metrixmatrix.com

EXPOSE 161/udp

ENTRYPOINT ["/bootstrap.sh"]