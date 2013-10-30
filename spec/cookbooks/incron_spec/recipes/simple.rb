include_recipe 'incron'

incron_d 'notify_home_changes' do
  path '/home'
  mask 'IN_MODIFY'
  command '/usr/local/bin/abcd'
end
