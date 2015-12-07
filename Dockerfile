# Runnable base
FROM ubuntu:trusty

# Basic config
RUN apt-get install -y -q software-properties-common \
 && add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) multiverse" \
 && add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates multiverse" \
 && sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list \
 && sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list \
 && apt-get -q -y update \
 && apt-get dist-upgrade -y --no-install-recommends \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y -q vim nano curl unzip wget logrotate cron supervisor unattended-upgrades \
 && mkdir -p /var/log/supervisor
