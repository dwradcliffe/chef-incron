default['incron']['allowed_users'] = ["root"]
default['incron']['denied_users'] = []
default['incron']['editor'] = "vim"

case node['platform_family']
when "debian"
  default['incron']['service_name'] = 'incron'
else
  default['incron']['service_name'] = 'incrond'
end
