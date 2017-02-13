log "message" do
  message "Installing Git from Debian Repository"
  level :info
end

apt_package "git" do
  action  :install
  notifies :run, 'bash[git-user-config]', :delayed
end

bash "git-user-config" do
  environment ({'HOME' => '/home/vagrant'})
  cwd "#{node['project_dir']}"
  code <<-END
    git config --global push.default simple
    git config --global user.name #{node['git']['user_name']};
    git config --global user.email #{node['git']['user_email']};
    git clone #{node['git']['repository_url']} #{node['git']['repository_dir']};
  END
  not_if do ::File.exist?("#{node['project_dir']}/#{node['git']['repository_dir']}/.git") end
end
