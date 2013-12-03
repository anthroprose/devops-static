Array(node['dependencies']).each do |p|
  
  Chef::Log.info "Downloading and Installing Dependency: #{p}"
  
  package p do
    action :install
  end
  
end