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

# Packages to big list
package ['tlp', 'thermald'] do
    action :install
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

# Device to node variable
mount '/' do
    device '62d9efc4-e9a7-4820-b7aa-a0f1bcf2228d'
    device_type :uuid
    fstype 'ext4'
    dump 0
    pass 1
    options 'discard,noatime,errors=remount-ro'
    action [:mount, :enable]
end




# systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
# sh -c 'echo -e "[Login]\nHandleLidSwitch=ignore\nHandleLidSwitchDocked=ignore" >> /etc/systemd/logind.conf'
# apt-get install tlp thermald -y
# sed -i -e 's/errors=remount-ro 0/discard,noatime,errors=remount-ro 0/g' /etc/fstab