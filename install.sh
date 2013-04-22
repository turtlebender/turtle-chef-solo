#!/bin/bash

sudo mkdir -p /var/chef
sudo mkdir -p /etc/chef
sudo cp -r ~/.chef/encrypted_data_bag_secret /etc/chef
sudo rsync -arv $CHEF_REPO/data_bags/ /var/chef/data_bags/
sudo rsync -arv $CHEF_REPO/roles/ /var/chef/roles/
sudo touch /var/chef/solo.rb
berks install --path cookbooks
sudo rsync -arv ./ /var/chef
sudo chef-solo -j solo.json
