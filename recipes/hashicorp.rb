# package ['vagrant', 'packer'] do
#   action :install
# end

directory '/usr/local/pkgs' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

remote_file '/usr/local/pkgs/vagrant_2.2.2_x86_64.deb' do
  source 'https://releases.hashicorp.com/vagrant/2.2.2/vagrant_2.2.2_x86_64.deb'
end

dpkg_package 'vagrant_2.2.2_x86_64.deb' do
  source '/usr/local/pkgs/vagrant_2.2.2_x86_64.deb'
  action :install
end

tf_version = node['hashicorp']['terraform']['version']
bash 'extract_and_move_terraform' do
  cwd '/tmp'
  code <<-EOB
    unzip terraform.zip
    chmod 0755 terraform
    mv terraform /usr/local/bin/terraform
  EOB
  action :nothing
end

remote_file '/tmp/terraform.zip' do
  source "https://releases.hashicorp.com/terraform/#{tf_version}/terraform_#{tf_version}_linux_amd64.zip"
  owner 'root'
  group 'root'
  action :create_if_missing
  not_if { ::File.exist?('/usr/local/bin/terraform') }
  notifies :run, 'bash[extract_and_move_terraform]', :immediately
end

pk_version = node['hashicorp']['packer']['version']
bash 'extract_and_move_packer' do
  cwd '/tmp'
  code <<-EOB
    unzip packer.zip
    chmod 0755 packer
    mv packer /usr/local/bin/packer
  EOB
  action :nothing
end

remote_file '/tmp/packer.zip' do
  source "https://releases.hashicorp.com/packer/#{pk_version}/packer_#{pk_version}_linux_amd64.zip"
  owner 'root'
  group 'root'
  action :create_if_missing
  not_if { ::File.exist?('/usr/local/bin/packer') }
  notifies :run, 'bash[extract_and_move_packer]', :immediately
end
