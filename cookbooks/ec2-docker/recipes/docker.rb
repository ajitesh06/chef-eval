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
  action :run
end

execute 'jenk-pass' do
  user 'root'
  action :run
  command 'docker exec jenkins-server cat /var/jenkins_home/secrets/initialAdminPassword'
end
