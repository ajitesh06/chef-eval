#
# Cookbook:: ec2-docker
# Recipe:: docker-install
#
# Copyright:: 2017, The Authors, All Rights Reserved.
execute 'docker.conf' do
  user 'root'
  action :run
  command 'mkdir -p /etc/systemd/system/docker.service.d'
end

execute 'update' do
  user 'root'
  cwd '/home/ec2-user/'
  action :run
  command 'yum update -y'
end

execute 'docker' do
  user 'root'
  cwd '/home/ec2-user/'
  action :run
  command 'yum install -y docker'
end

execute 'docker.service' do
  user 'root'
  cwd '/home/ec2-user/'
  action :run
  command 'service docker start'
end

execute 'group' do
  user 'root'
  cwd '/home/ec2-user/'
  action :run
  command 'sudo usermod -a -G docker ec2-user'
end

execute 'docker-check' do
  user 'root'
  cwd '/home/ec2-user/'
  action :run
  command 'docker info'
end

template '/etc/systemd/system/docker.service.d/docker.conf' do
  source 'docker.erb'
end

