name 'docker-server'
run_list "recipe[ec2-docker::default]", "recipe[ec2-docker::os-essentials]", "recipe[ec2-docker::docker-install]", "recipe[ec2-docker::docker]"
