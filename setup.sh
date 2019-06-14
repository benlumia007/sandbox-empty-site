#!/bin/bash

# This should create the basic .conf file for a specific site when it is doing a provision.
if [[ ! -f /etc/nginx/conf.d/${domain}.conf ]]; then
  echo "copying nginx.conf to /etc/nginx/conf.d/${domain}.conf"
  cp "/srv/config/nginx/nginx.conf" "/etc/nginx/conf.d/${domain}.conf"
  sed -i -e "s/{{DOMAIN}}/${domain}/g" "/etc/nginx/conf.d/${domain}.conf"
fi

if [[ ! -d ${vm_dir}/public_html ]]; then
    echo "Creating ${vm_dir}/public_html"
    mkdir -p ${vm_dir}/public_html
fi
