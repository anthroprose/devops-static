#!/bin/bash
rpm -iv http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
yum install -y git
curl -L http://www.opscode.com/chef/install.sh > /tmp/install.sh
chmod +x /tmp/install.sh
/tmp/install.sh -v 11.6.0
mkdir -p /var/chef/cookbooks
cd /var/chef/cookbooks/
git init
touch README.md
git add README.md
git commit README.md -m '.'
knife cookbook site install yum
knife cookbook site install git
knife cookbook site install nginx
knife cookbook site install chef-solo-search
knife cookbook site install rsyslog
knife cookbook site install cron
knife cookbook site install logrotate

# Totally a Hack!
rm -rf /tmp/vagrant-chef-1/chef-solo-1/cookbooks/*
ln -s /var/chef/cookbooks/* /tmp/vagrant-chef-1/chef-solo-1/cookbooks/