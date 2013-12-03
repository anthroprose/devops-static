include_recipe "static::default"

template "/etc/nginx/sites-enabled/static.conf" do
  mode "0600"
  source "static.conf.erb"
  variables(
    :root => node['static']['media'],
    :server => node['static']['hostname'],
    :port => node['static']['port']
  )
end

