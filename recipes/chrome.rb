apt_repository 'google-chrome' do
  uri node['chrome']['upstream_repo']
  key node['chrome']['signing_key']
  distribution 'stable'
  components ['main']
  action :add
  # Google will manage it after the install
  not_if { ::File.exist?('/etc/apt/sources.list.d/google-chrome.list') }
end

package 'google-chrome-stable' do
  action :install
end
