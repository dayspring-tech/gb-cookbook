#
# write default.vcl
#

service 'varnish' do
  supports restart: true, reload: true
  action :nothing
end

template "#{node['varnish']['dir']}/#{node['varnish']['vcl_conf']}" do
  source "varnish.vcl.erb"
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, 'service[varnish]'
end
