#
# Cookbook Name:: dt_opsworks
# Recipe:: mount_ebs
# 
# Expects an EBS volume to be mounted at /mnt/application.
# This will create symlinks from /mnt/application/[app_name] to
# /srv/www/[app_name], allowing the app to be installed on a larger volume.
#
mount_point = "/mnt/application"

if mount_point
  node[:deploy].each do |application, deploy|
    directory "#{mount_point}/#{application}" do
      owner deploy[:user]
      group deploy[:group]
      mode 0770
      recursive true
    end

    link "/srv/www/#{application}" do
      to "#{mount_point}/#{application}"
    end
  end
end
