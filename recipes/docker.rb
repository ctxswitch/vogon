package ['apt-transport-https', 'ca-certificates', 'curl', 'gnupg2', 'software-properties-common'] do
  action :install
end

apt_repository 'docker' do
  uri node['docker']['upstream_repo']
  key node['docker']['signing_key']
  arch 'amd64'
  components ['stable']
  action :add
end

package 'docker-ce' do
  action :install
end

group 'docker' do
  members ENV['SUDO_USER']
  action :create
end
