#
# Cookbook:: vogon
# Recipe:: gnome
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

apt_repository 'flux' do
  uri 'ppa:nathan-renniewaldock/flux'
end

pkgs = %w(
  faenza-icon-theme fonts-cantarell adwaita-icon-theme-full
  gnome-shell-extensions gnome-sushi gnome-system-monitor
  gnome-themes-extra gnome-themes-extra-data gnome-backgrounds
  gnome-calculator gnome-characters gnome-contacts gnome-logs
  gnome-session gnome-core fluxgui
)

package pkgs do
  action :install
end
