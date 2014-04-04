name             'incron'
maintainer       'David Radcliffe'
maintainer_email 'radcliffe.david@gmail.com'
license          'MIT'
description      'Installs and configures incron'
version          '0.2.0'

recipe 'incron',  'Install incron package and starts the service'

depends 'yum', '< 3.0'

supports 'amazon'
supports 'centos'
supports 'debian'
supports 'fedora'
supports 'oracle'
supports 'redhat'
supports 'scientific'
supports 'ubuntu'
