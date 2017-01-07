log "message" do
  message "Installing Latest Composer Snapshot from Web"
  level :info
end

remote_file "/usr/local/bin/composer" do
    source "https://getcomposer.org/composer.phar"
    mode "0755"
end
