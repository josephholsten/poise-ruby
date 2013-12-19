case node['ruby']['version']
when '1.8'
  packages = %w(ruby1.8 ruby1.8-dev rubygems)
when '1.9'
  packages = %w(ruby1.9.1 ruby1.9.1-dev)
  # rubygems is included in ruby1.9.1
when '2.0'
  packages = %w(ruby2.0 ruby2.0-dev)
  # rubygems is included in ruby2.0
end

packages.each do |pkg|
  r = package pkg do
    action( node['ruby']['compiletime'] ? :nothing : :install )
  end
  r.run_action(:install) if node['ruby']['compiletime']
end

r = ohai 'ruby plugin' do
  action( node['ruby']['compiletime'] ? :nothing : :reload )
  plugin 'ruby'
end
r.run_action(:reload) if node['ruby']['compiletime']
