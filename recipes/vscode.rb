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

###
### Commands run on the command line
###
# apt-get install curl
# curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
# install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
# sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
# apt-get install apt-transport-https
# apt-get update
# apt-get install code