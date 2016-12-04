# Runnable base
FROM ubuntu:trusty

# Basic config
RUN apt-get -q -y update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common python-software-properties \
 && add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe" \
 && add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main restricted universe multiverse" \
 && add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates main restricted universe multiverse" \
 && add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-security main restricted universe multiverse" \
 && apt-get -q -y update && apt-get dist-upgrade -y --no-install-recommends \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y -q vim nano curl unzip wget logrotate cron supervisor unattended-upgrades gettext-base \
 && mkdir -p /var/log/supervisor

ADD ./config /etc/
