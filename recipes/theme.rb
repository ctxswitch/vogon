package 'faenza-icon-theme' do
    action :install
end

git "~/fonts" do
    repository 'git_repository'
    revision 'master'
    action :sync
    notifies :run, 'execute[install fonts], :immediately'
end

execute 'install fonts' do
    command './install.sh'
    cwd '~/fonts'
    action :run
end

package 'zsh' do
    action :install
end

git '~/.zprezto' do
    repository 'https://github.com/sorin-ionescu/prezto.git'
    revision 'master'
    action :sync
end

rcs = [
    'zlogin',
    'zlogout',
    'zpreztorc',
    'zprofile',
    'zshenv',
    'zshrc'
]

rcs.each do |rc|
    link rc do
        to "~/.#{rc}"
    end
end

# Need to update zpreztorc and zlogin files
