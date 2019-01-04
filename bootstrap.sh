#!/bin/bash
set -ex

apt install curl git

SUDO_USER_HOME=$(eval echo ~$SUDO_USER)

echo "Using home: $SUDO_USER_HOME"

if ! [ -f /tmp/chefdk.deb ] ; then
	curl -o /tmp/chefdk.deb https://packages.chef.io/files/stable/chefdk/3.5.13/debian/9/chefdk_3.5.13-1_amd64.deb
else
	echo "ChefDK has already been downloaded"
fi

apt install /tmp/chefdk.deb

mkdir -p /var/chef/{cache,nodes}
mkdir -p ${SUDO_USER_HOME}/chef/{cookbooks,data_bags,vogon}
mkdir -p /etc/chef

cat > /etc/chef/client.rb << 'EOF'
current_dir       = File.expand_path(File.dirname(__FILE__))
home_dir          = Dir.home(ENV['SUDO_USER'])
file_cache_path   "/var/chef/cache"
node_path         "/var/chef/nodes"
cookbook_path     "#{home_dir}/chef/cookbooks"
data_bag_path     "#{home_dir}/chef/data_bags"
log_level         :info
EOF

VOGON_REPO=${VOGON_REPO:-https://github.com/rlyon/vogon.git}
echo "Using the following repo: $VOGON_REPO"
if ! [ -d ${SUDO_USER_HOME}/chef/cookbooks/vogon ] ; then
	git clone https://github.com/rlyon/vogon.git ${SUDO_USER_HOME}/chef/cookbooks/vogon
else
	echo "The vogon repo is already installed. Skipping..."
fi

cat > /usr/local/bin/vogon << EOF
#!/bin/bash

function usage {
	echo "Usage:"
	echo "  vogon help           Display help"
	echo "  vogon check          Run in check mode"
	echo "  vogon apply          Apply changes"
}

cmd=\$1

case "\$cmd" in
	help )
		usage
	exit 0
	;;
	check )
		sudo chef-solo -j ${SUDO_USER_HOME}/chef/vogon/client.json -W
		exit \$?
		;;
	apply )
		sudo chef-solo -j ${SUDO_USER_HOME}/chef/vogon/client.json
		exit \$?
		;;
	*)
		echo "ERROR: Invalid subcommand given." 2>&1
		usage
		exit 1
		;;  
esac

EOF

chmod 0755 /usr/local/bin/vogon 

if ! [[ -f ${SUDO_USER_HOME}/chef/vogon/client.json ]] ; then
	cat > ${SUDO_USER_HOME}/chef/vogon/client.json << 'EOF'
{
    "run_list": [
        "recipe[vogon::default]"
    ]
}
EOF
fi

chown -R ${SUDO_USER}:${SUDO_USER} ${SUDO_USER_HOME}/chef