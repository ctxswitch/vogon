default['docker']['upstream_repo'] =
  case node['platform']
  when 'debian'
    "https://download.docker.com/linux/#{node['platform_family']}"
  end

default['docker']['signing_key'] =
  case node['platform']
  when 'debian'
    "https://download.docker.com/linux/#{node['platform_family']}/gpg"
  end