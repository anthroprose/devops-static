name              "DevOps - Static"
maintainer        "Alex Corley"
maintainer_email  "acorley@anthroprose.com"
license           ""
description       "Installs & Configures a Static Stack"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.0.1"

recipe "default", "Installs and configures dependencies"

%w{ centos }.each do |os|
  supports os
end

depends "yum"