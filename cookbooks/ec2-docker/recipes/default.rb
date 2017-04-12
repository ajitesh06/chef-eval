#
# Cookbook:: ec2-docker
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
search('users', '*:*').each do |user_data|
  user user_data['id'] do
    uid user_data['uid']
    gid user_data['gid']
    home user_data['home']
    shell user_data['shell']
  end
end
search('groups', '*:*').each do |data|
  group data['id'] do
    gid data['gid']
  end
end
