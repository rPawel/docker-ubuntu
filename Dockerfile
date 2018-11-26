# Runnable base
FROM ubuntu:bionic

# Basic config
RUN apt-get -q -y update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common \
 && apt-get -q -y update && apt-get dist-upgrade -y --no-install-recommends \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y -q vim nano curl unzip wget logrotate cron supervisor unattended-upgrades gettext-base rsyslog \
 && mkdir -p /var/log/supervisor

ADD ./config /etc/
