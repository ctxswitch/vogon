default['docker']['upstream_repo'] =
  case node['platform_family']
  when 'debian'
    "https://download.docker.com/linux/#{node['platform']}"
  end

default['docker']['signing_key'] =
  case node['platform_family']
  when 'debian'
    "https://download.docker.com/linux/#{node['platform']}/gpg"
  end
