resource_name :vscode_ext

property :ext_name, String, name_property: true
property :become_user, String, default: 'root'
property :become_method, String, default: 'sudo'

def load_current_resource
end

action :install do
  shell_out!(
    new_resource.become_method, '-u', new_resource.become_user,
    'code', '--install-extension', new_resource.ext_name
  )
end

action :remove do
  shell_out!(
    new_resource.become_method, '-u', new_resource.become_user,
    'code', '--uninstall-extension', new_resource.ext_name
  )
end
