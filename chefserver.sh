#!/bin/bash
yum update -y
mkdir /chef
wget https://packages.chef.io/files/stable/chef-server/12.17.5/el/7/chef-server-core-12.17.5-1.el7.x86_64.rpm -O /chef/chef.rpm
chmod -x /chef/chef.rpm
rpm -Uvh /chef/chef.rpm
chef-server-ctl reconfigure
chef-server-ctl user-create admin FIRST_NAME LAST_NAME jdbeitz@gmail.com 'P@ssword' --filename /chef/admin.pem
chef-server-ctl org-create short_name 'sogeti' --association_user admin --filename /chef/sogeti_org-validator.pem
chef-server-ctl install chef-manage
chef-server-ctl reconfigure
chef-manage-ctl reconfigure  --accept-license
#upload .pem to s3