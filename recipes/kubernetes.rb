#
# Cookbook:: vogon
# Recipe:: kubernetes
#
# The MIT License (MIT)
#
# Copyright:: 2019, Rob Lyon
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

package ['apt-transport-https', 'ca-certificates', 'curl', 'gnupg2', 'software-properties-common'] do
  action :install
end

apt_repository 'docker' do
  uri node['kubernetes']['docker_upstream_repo']
  key node['kubernetes']['docker_signing_key']
  arch 'amd64'
  components ['stable']
  action :add
end

apt_repository 'kubernetes' do
  uri node['kubernetes']['k8s_upstream_repo']
  key node['kubernetes']['k8s_signing_key']
  components ['kubernetes-xenial', 'main']
  action :add
end

package 'docker-ce' do
  action :install
end

group 'docker' do
  members ENV['SUDO_USER']
  action :create
end

package 'kubctl' do
  action :install
end

remote_file '/usr/bin/minikube' do
  source node['kubernetes']['minikube_url']
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

remote_file '/usr/local/bin/docker-machine' do
  source node['kubernetes']['docker_machine_url']
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

remote_file '/usr/local/bin/docker-machine-driver-kvm2' do
  source node['kubernetes']['docker_machine_kvm2_url']
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
