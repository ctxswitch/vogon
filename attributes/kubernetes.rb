default['kubernetes']['docker_upstream_repo'] =
  case node['platform_family']
  when 'debian'
    "https://download.docker.com/linux/#{node['platform']}"
  end

default['kubernetes']['docker_signing_key'] =
  case node['platform_family']
  when 'debian'
    "https://download.docker.com/linux/#{node['platform']}/gpg"
  end

default['kubernetes']['k8s_upstream_repo'] =
  case node['platform_family']
  when 'debian'
    "http://apt.kubernetes.io/"
  end

default['kubernetes']['k8s_signing_key'] =
  case node['platform_family']
  when 'debian'
    "https://packages.cloud.google.com/apt/doc/apt-key.gpg"
  end

default['kubernetes']['minikube_url'] = "https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"
default['kubernetes']['docker_machine_url'] = "https://github.com/docker/machine/releases/download/v0.16.1/docker-machine-#{node['kernel']['name']}-#{node['kernel']['machine']}"
default['kubernetes']['docker_machine_kvm2_url'] = "https://storage.googleapis.com/minikube/releases/latest/docker-machine-driver-kvm2"