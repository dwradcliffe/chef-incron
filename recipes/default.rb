#
# Cookbook Name:: incron
# Recipe:: default
#

include_recipe 'yum-repoforge' if platform_family?('rhel')

package 'incron' do
  action :install
end

service 'incrond' do
  service_name node['incron']['service_name']
  supports :status => true, :restart => true, :reload => node['incron']['reload_method'] == :reload
  action [:enable, :start]
end

template '/etc/incron.conf' do
  source 'incron.conf.erb'
  mode '0644'
  action :create
  notifies node['incron']['reload_method'], 'service[incrond]'
end
