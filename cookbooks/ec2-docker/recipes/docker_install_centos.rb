
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
  command 'yum install -y yum-utils'
end

execute 'docker.service' do
  user 'root'
  cwd '/home/ec2-user/'
  action :run
  command 'yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo'
end

execute 'group' do
  user 'root'
  cwd '/home/ec2-user/'
  action :run
  command 'yum makecache fast'
end

execute 'docker-check' do
  user 'root'
  cwd '/home/ec2-user/'
  action :run
  command 'yum install -y docker-ce'
end

template '/etc/systemd/system/docker.service.d/docker.conf' do
  source 'docker.erb'
end
