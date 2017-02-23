# -*- coding: utf-8 -*-
node['pentestenv']['authorized_keys'].each do |user, keys|
  i = 0
  keys.each do |k|
    i += 1
    ssh_authorize_key "#{user}-#{i}" do
      user user
      key k
    end
  end
end
