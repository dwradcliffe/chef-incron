#
# Cookbook Name:: incron
# Recipe:: default
#

include_recipe 'yum-repoforge' if platform_family?('rhel')

package 'incron' do
  action :install
end

centos7 = platform_family?('centos') && node['platform_version'].to_f >= 7.0

service 'incrond' do
  service_name node['incron']['service_name']
  supports :status => true, :restart => true, :reload => !centos7
  action [:enable, :start]
end

template '/etc/incron.conf' do
  source 'incron.conf.erb'
  mode '0644'
  action :create
  if centos7
    notifies :restart, 'service[incrond]'
  else
    notifies :reload, 'service[incrond]'
  end
end
