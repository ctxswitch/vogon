resource_name :hashicorp_package

property :product, String, name_property: true
property :version, String, default: '0.0.0'
property :url, String, default: lazy { |r|
  "https://releases.hashicorp.com/#{r.product}/#{r.version}/#{r.product}_#{r.version}_linux_amd64.zip"
}

def load_current_resource
end

action :install do
  remote_file "/tmp/#{new_resource.product}-#{new_resource.version}.zip" do
    source node['hashicorp']['terraform']['url']
    owner 'root'
    group 'root'
    action :create_if_missing
    not_if { ::File.exist?("/usr/local/bin/#{new_resource.product}-#{new_resource.version}") }
    notifies :run, 'bash[extract_and_move]', :immediately
  end
end

action :remove do
  filenames = [
    new_resource.product,
    "#{new_resource.product}-#{new_resource.version}",
  ]
  file filenames do
    action :remove
  end
end
