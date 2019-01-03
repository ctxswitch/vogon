package "linux-headers-#{node['kernel']['release']}"
package %w(gcc make dkms) do
  action :install
end

apt_repository 'virtualbox' do
  uri node['vbox']['upstream_repo']
  key node['vbox']['signing_key']
  distribution node['lsb']['codename']
  components ['contrib']
  action :add
end

package ['virtualbox-6.0'] do
  action :install
end
