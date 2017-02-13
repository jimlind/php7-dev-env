log "message" do
  message "Running php7-dev-env Base Setup"
  level :info
end

directory "#{node['project_dir']}" do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end
