default['chrome']['upstream_repo'] =
  case node['platform']
  when 'debian'
    'http://dl.google.com/linux/chrome/deb/'
  end

default['chrome']['signing_key'] =
  case node['platform']
  when 'debian'
    'https://dl.google.com/linux/linux_signing_key.pub'
  end
    