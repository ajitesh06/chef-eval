#
# Cookbook:: ec2-docker
# Recipe:: docker
#
# Copyright:: 2017, The Authors, All Rights Reserved.

docker_service 'default' do
  action [:create, :start]
end

docker_image 'jenkins' do
  action :pull
end

docker_container 'jenkins-server' do
  repo 'jenkins'
  port '8080:8080'
  command '--name=jenkins-server'
  action :run
end 
