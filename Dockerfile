# Runnable base
FROM ubuntu:trusty

# Basic config
RUN locale-gen en_GB.UTF-8 \
 && echo "Europe/London" | tee /etc/timezone; dpkg-reconfigure --frontend noninteractive tzdata \
 && apt-get install -y -q software-properties-common \
 && add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) multiverse" \
 && add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates multiverse" \
 && apt-get -q -y update \
 && apt-get -q -y upgrade \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y -q vim.tiny nano git subversion curl unzip wget exim4 logrotate cron supervisor

