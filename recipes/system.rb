# Handle linux systems that have issues with suspend
unless node['system']['options']['suspend_capable']
  systemd_unit ['sleep.target', 'suspend.target', 'hibernate.target', 'hybrid-sleep.target'] do
    action :mask
  end

  systemd_unit 'root-resume.service' do
    content <<-EOU.gsub(/^\s+/, '')
    [Unit]
    Description=Local system resume actions
    After=suspend.target

    [Service]
    Type=simple
    ExecStart=/bin/systemctl restart NetworkManager.service

    [Install]
    WantedBy=suspend.target
    EOU
    action [:create, :enable]
  end

  file '/etc/systemd/logind.conf' do
    content <<-EOU.gsub(/^\s+/, '')
    # Managed by Chef
    [Login]
    HandleLidSwitch=ignore
    HandleLidSwitchDocked=ignore
    EOU
    owner 'root'
    group 'root'
    mode '0644'
    action :create
  end
end

node['system']['ssd_devices'].each do |dv|
  mount '/' do
    device dv
    device_type :uuid
    fstype 'ext4'
    dump 0
    pass 1
    options 'discard,noatime,errors=remount-ro'
    action [:mount, :enable]
  end
end

if node['system']['options']['vm_tools']
  package 'open-vm-tools' do
    action :install
  end
end

# Packages to big list
package ['tlp', 'thermald'] do
  action :install
end
