#
# Cookbook Name:: ror
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package ['git-core','curl','automake'] do
  action :install
end

bash 'install_rvm' do
  user 'rahul'
  cwd '/home/rahul'
  code <<-EOH
	curl -L https://get.rvm.io | bash -s stable
	source ~/.rvm/scripts/rvm
	rvm install 2.2.3
	rvm use 2.2.3 --default
	ruby -v
  EOH
end
bash 'install_bundler' do
	user 'rahul'
	cwd '/home/rahul/'
	code <<-EOH

	source ~/.rvm/scripts/rvm &&	gem install bundler
	EOH
end

bash 'installing_rails' do
	user 'rahul'
	cwd '/home/rahul'
	code <<-EOH
		sudo add-apt-repository ppa:chris-lea/node.js
		sudo apt-get update
		sudo apt-get -y install nodejs
		 source ~/.rvm/scripts/rvm &&  gem install rails -v 4.2.1
	EOH
end

