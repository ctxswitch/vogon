default['vbox']['upstream_repo'] =
  case node['platform_family']
  when 'debian'
    'http://download.virtualbox.org/virtualbox/debian'
  end

default['vbox']['signing_key'] =
  case node['platform_family']
  when 'debian'
    [ 'https://www.virtualbox.org/download/oracle_vbox_2016.asc',
      'https://www.virtualbox.org/download/oracle_vbox.asc' ]
  end
