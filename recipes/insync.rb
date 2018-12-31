apt_repository 'insync' do
  uri 'http://apt.insynchq.com/debian'
  key 'https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key'
  distribution 'stretch'
  components ['non-free', 'contrib']
  action :add
end

directory '/home/rlyon/GoogleDrive' do
  owner node['vogon']['user']
  group node['vogon']['group']
  mode '0755'
  action :create
end

package 'insync' do
  action :install
end
