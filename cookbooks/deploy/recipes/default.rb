

#
# Cookbook Name:: deploy
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
git '/home/rahul/wheel' do
   repository 'https://github.com/bigbinary/wheel.git'
   revision 'master'
   action :sync
 
end
bash 'deploying_app' do

cwd '/home/rahul/wheel/'
user 'rahul'
code <<-EOH
cd /home/rahul/wheel/
	source ~/.rvm/scripts/rvm && 	bundle install
	cp config/database.yml.postgresqlapp config/database.yml
	rake db:migrate
        rake assets:precompile
        sudo service unicorn_wheel stop
        sleep 15
        sudo service unicorn_wheel start
        sudo service delayed_job stop
        sleep 15
        sudo service delayed_job start

        sudo service nginx restart

EOH
end
