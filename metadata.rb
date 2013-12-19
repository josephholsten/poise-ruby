name             'ruby'
maintainer        'Noah Kantrowitz'
maintainer_email  'noah@opscode.com'
license           "Apache 2.0"
description      'Installs ruby'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ ubuntu }.each do |os|
  supports os
end
