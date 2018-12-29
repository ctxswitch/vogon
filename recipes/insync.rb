apt_repository 'insync' do
    uri 'http://apt.insynchq.com/debian'
    distribution 'stretch'
    components ['non-free', 'contrib']
    action :add
end

directory '/home/rlyon/GoogleDrive' do
    owner 'rlyon'
    group 'rlyon'
    mode '0755'
    action :create
end

package 'insync' do
    action :install
end

