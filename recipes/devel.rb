apt_repository 'virtualbox' do
    uri 'http://download.virtualbox.org/virtualbox/debian'
    key 'https://www.virtualbox.org/download/oracle_vbox_2016.asc'
    distribution 'stretch'
    components ['contrib']
    action :add
end

package ['virtualbox-6.0', 'vagrant','packer'] do
    action :install
end
