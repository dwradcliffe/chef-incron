# chef-incron

[![Build Status](https://travis-ci.org/dwradcliffe/chef-incron.png?branch=master)](https://travis-ci.org/dwradcliffe/chef-incron)

Installs the incron package and starts the incrond service.

## About incron

Incron is an "inotify cron" system. It consists of a daemon and a table manipulator. You can use it a similar way as the regular cron. The difference is that the inotify cron handles filesystem events rather than time periods.

[More information about incron](http://inotify.aiken.cz/?section=incron&page=about&lang=en)

## Attributes

### `default`

* `default['incron']['allowed_users']` is an array of users allowed, defaults to `["root"]`
* `default['incron']['denied_users']` is an array of users denied, defaults to `[]`
* `default['incron']['editor']` is the editor user editing a job via command line, defaults to `vim`
* `default['incron']['service_name']` is the name of the system service, defaults to `incron` on debian and `incrond` on rhel platforms

## Recipes

### `default`

This will install the incron package and start the service.

## Resources

### `incron_d`

This resource helps you create a system incron table.

```ruby
incron_d "notify_home_changes" do
  path "/home"
  mask "IN_MODIFY"
  command "/usr/local/bin/abcd"
end
```

[More information about syntax](http://linux.die.net/man/5/incrontab)

### `incron_user`

This resource helps you manage the allow and deny list for incron.

```ruby
incron_user "root" do
  action :allow
end
```

## License, Author and Contributor(s)

License: [MIT](https://github.com/dwradcliffe/chef-incron/blob/master/LICENSE)

Author: [David Radcliffe](https://github.com/dwradcliffe)

Contributor: [Salvatore Poliandro III](https://github.com/popsikle)

