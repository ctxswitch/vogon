default['chrome']['upstream_repo'] =
  case node['platform_family']
  when 'debian'
    'http://dl.google.com/linux/chrome/deb/'
  end

default['chrome']['signing_key'] =
  case node['platform_family']
  when 'debian'
    'https://dl.google.com/linux/linux_signing_key.pub'
  end
    
