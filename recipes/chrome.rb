apt_repository 'google-chrome' do
    uri 'http://dl.google.com/linux/chrome/deb/'
    key 'https://dl.google.com/linux/linux_signing_key.pub'
    distribution 'stable'
    components ['main']
    action :add
    # Google will manage it after the install
    not_if { ::File.exist?('/etc/apt/sources.list.d/google-chrome.list') }
end

package 'google-chrome-stable' do
    action :install
end
