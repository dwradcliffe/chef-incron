default['incron']['allowed_users'] = ['root']
default['incron']['denied_users'] = []
default['incron']['editor'] = 'vim'

default['incron']['reload_method'] = if node['platform_family'] == 'rhel' && node['platform_version'].to_f >= 7.0
                                       :restart
                                     else
                                       :reload
                                     end

default['incron']['service_name'] = case node['platform_family']
                                    when 'debian'
                                      'incron'
                                    else
                                      'incrond'
                                    end
