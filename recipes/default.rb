#
# Cookbook Name:: incron
# Recipe:: default
#

include_recipe 'yum::repoforge' if platform_family?('rhel')

package 'incron' do
  action :install
end

service 'incrond' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
