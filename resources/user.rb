actions :allow, :deny
default_action :allow

attribute :username, :kind_of => String, :name_attribute => true
attribute :cookbook, :kind_of => String, :default => 'incron'
