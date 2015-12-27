

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
EOH
end
