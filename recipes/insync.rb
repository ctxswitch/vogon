apt_repository 'insync' do
  uri node['insync']['upstream_repo']
  key node['insync']['signing_key']
  distribution node['lsb']['codename']
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
