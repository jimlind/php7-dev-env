log "message" do
  message "Installing Git from Debian Repository"
  level :info
end

apt_package "git" do
    action  :install
end
