package ['apt-transport-https', 'ca-certificates', 'curl', 'gnupg2', 'software-properties-common'] do
    action :install
end

apt_repository 'docker' do
    uri 'https://download.docker.com/linux/debian'
    key 'https://download.docker.com/linux/debian/gpg'
    arch 'amd64'
    components ['stable']
    action :add
end

package 'docker-ce' do
    action :install
end


# apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
# curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
# add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
# apt-get update
# apt install docker-ce