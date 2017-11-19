# Runnable base
FROM ubuntu:trusty

# Basic config
RUN DEBIAN_FRONTEND=noninteractive apt-get -q -y update \
 && apt-get install -y -q software-properties-common \
 && sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list \
 && sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list \
 && apt-get -q -y update \
 && apt-get dist-upgrade -y --no-install-recommends \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y -q vim nano curl unzip wget logrotate cron supervisor unattended-upgrades gettext-base \
 && mkdir -p /var/log/supervisor

ADD ./config /etc/
