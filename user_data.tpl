#cloud-config
runcmd:
  - yum update
  - yum -y install nginx
  - /etc/init.d/nginx start
  - chkconfig nginx on
  - mkdir -p /data/www
  - cd /data/www/
  - wget www.ballotonline.biz/website.zip
  - unzip website.zip -d /data/www/BallotOnline
  - chmod 755 /data/www/BallotOnline/index.html
  - mv /etc/nginx/nginx.conf   /etc/nginx/nginx.conf.old
  - cp /data/www/BallotOnline/nginx.conf  /etc/nginx/
  - /etc/init.d/nginx restart

output : { all : '| tee -a /var/log/cloud-init-output.log' }
