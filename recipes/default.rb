#
# Cookbook:: vogon
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

default_pkgs = %w(git curl wget net-tools tmux dnsutils)

package default_pkgs do
  action :install
end
