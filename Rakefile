# -*- coding: utf-8 -*-

task :vendor do
  sh 'test -d cookbooks && rm -rf cookbooks || exit 0'
  sh 'berks vendor cookbooks'
end

task default: ['vendor']
