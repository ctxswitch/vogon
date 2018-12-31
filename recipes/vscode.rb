package ['curl', 'apt-transport-https'] do
  action :install
end

apt_repository 'vscode' do
  uri 'https://packages.microsoft.com/repos/vscode'
  key 'https://packages.microsoft.com/keys/microsoft.asc'
  arch 'amd64'
  distribution 'stable'
  components ['main']
  action :add
end

package 'code' do
  action :install
end

node['vscode']['extensions'].each do |ext|
  vscode_ext ext do
    become_user node['vogon']['user']
    action :install
  end
end
