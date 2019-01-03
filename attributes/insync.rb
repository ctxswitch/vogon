default['insync']['upstream_repo'] =
  case node['platform_family']
  when 'debian'
    'http://apt.insynchq.com/debian'
  end

default['insync']['signing_key'] =
  case node['platform_family']
  when 'debian'
    'https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key'
  end
