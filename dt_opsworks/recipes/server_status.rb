node[:deploy].each do |application, deploy|
    # create sites-available directory for the server_status apache config
    directory "#{node[:apache][:dir]}/sites-available/#{application}.conf.d" do
      mode 0755
      owner "#{node[:apache][:user]}"
      action :create
    end

    template "#{node[:apache][:dir]}/sites-available/#{application}.conf.d/local-status" do
        source "server_status.erb"
        owner "#{node[:apache][:user]}"
        mode 0644
    end
end

service "httpd" do
    action :reload
end
