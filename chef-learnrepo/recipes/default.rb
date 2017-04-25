#
# Cookbook Name:: learnrepo
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.

# Purposefully not using firewall cookbook so as to not need dependencies that might not be available
execute 'disable_outbound' do
  command 'iptables -t filter -I OUTPUT 1 -m state --state NEW -j DROP'
end

# With networking disabled via .kitchen.yml, can we install packages?
package [ 'httpd', 'redis', 'ruby', 'mariadb', 'mariadb-server' ]
