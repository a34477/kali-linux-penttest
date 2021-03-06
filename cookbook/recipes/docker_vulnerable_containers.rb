# -*- coding: utf-8 -*-

images = ['vulnerables/web-dvwa',
          'vulnerables/cve-2016-10033',
          'vulnerables/cve-2016-7434',
          'vulnerables/cve-2014-6271',
          'vulnerables/cve-2016-6515',
          'vulnerables/cve-2014-0160',
          'vulnerables/web-roundcube-1.2.2-rce',
          'vulnerables/cve-2016-4977',
          'chengyunchu/vulnodejs',
          'tolchz/vsftpd-vuln',
          'wpscanteam/vulnerablewordpress']

images.each do |image|
  docker_image image do
    action :pull_if_missing
  end

  docker_container image.split('/')[1] do
    repo image
    action :run_if_missing
    publish_all_ports true
  end
end
