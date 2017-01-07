log "message" do
  message "Installing PHP7.1 from deb.sury.org Repository."
  level :info
end

apt_package "apt-transport-https" do
  action :install
end

apt_repository "deb-sury-org" do
  uri          "https://packages.sury.org/php"
  distribution "jessie"
  components   ["main"]
  key          "https://packages.sury.org/php/apt.gpg"
  action       :add
end

apt_package "php7.1" do
  action :install
end

apt_repository "deb-sury-org" do
  action :remove
end
