#
# Cookbook:: ec2-docker
# Recipe:: os-essentials
#
# Copyright:: 2017, The Authors, All Rights Reserved.
template '/etc/ssh/sshd_config' do
  source 'os-essentials.erb'
end

remote_file '/bin/script.sh' do
  source 'https://s3.amazonaws.com/osharding/script.sh'
  owner 'root'
  mode '0755'
  action :create
end

execute 'script' do
  user 'root'
  cwd '/bin'
  action :run
  command 'script.sh'
end
