default['incron']['allowed_users'] = ['root']
default['incron']['denied_users'] = []
default['incron']['editor'] = 'vim'

if node['platform_family'] == 'rhel' && node['platform_version'].to_f >= 7.0
  default['incron']['reload_method'] = :restart
else
  default['incron']['reload_method'] = :reload
end

case node['platform_family']
when 'debian'
  default['incron']['service_name'] = 'incron'
else
  default['incron']['service_name'] = 'incrond'
end
