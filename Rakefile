# -*- coding: utf-8 -*-

task :vendor do
  rm_rf 'cookbooks'
  sh 'berks vendor cookbooks'
end

task default: ['vendor']
