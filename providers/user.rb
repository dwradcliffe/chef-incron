def whyrun_supported?
  true
end

action :allow do
  update_config('allow')
end

action :deny do
  update_config('deny')
end

def update_config(list_type = 'allow')
  # Get a list of allowed and denied users
  case list_type
  when 'allow'
    users = node.default['incron']['allowed_users']
  when 'deny'
    users = node.default['incron']['denied_users']
  else
    return false
  end

  users << new_resource.username unless users.include?(new_resource.username)

  run_context.resource_collection.each do |res|
    if res.resource_name == 'incron_user'
      if res.action == new_resource.action
        users << res.username unless users.include?(username)
      end
    end
  end

  t = template "/etc/incron.#{list_type}" do
    cookbook new_resource.cookbook
    source 'incron.users.erb'
    mode '0644'
    variables(
      :users => users
    )
    action :create
    notifies node['incron']['reload_method'], 'service[incrond]'
  end

  new_resource.updated_by_last_action(t.updated_by_last_action?)
end
