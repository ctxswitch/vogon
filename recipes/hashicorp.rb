package ['vagrant', 'packer'] do
  action :install
end

tf_version = node['hashicorp']['terraform']['version']
bash 'extract_and_move' do
  cwd '/tmp'
  code <<-EOB
    unzip terraform.zip
    chmod 0755 terraform
    mv terraform /usr/local/bin/terraform
  EOB
end

remote_file '/tmp/terraform.zip' do
  source "https://releases.hashicorp.com/terraform/#{tf_version}/terraform_#{tf_version}_linux_amd64.zip"
  owner 'root'
  group 'root'
  action :create_if_missing
  not_if File.exist?('/usr/local/bin/terraform')
  notifies :run, 'bash[extract_and_move]', :immediately
end
