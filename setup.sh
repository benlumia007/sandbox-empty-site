#!/bin/bash

# This should create the basic .conf file for a specific site when it is doing a provision.
if [[ ! -f /etc/apache2/sites-available/${domain}.conf ]]; then
  echo "copying apache2.conf to /etc/apache2/sites-available/${domain}.conf"
  cp "/srv/config/apache/apache.conf" "/etc/apache2/sites-available/${domain}.conf"
  sed -i -e "s/{{DOMAIN}}/${domain}/g" "/etc/apache2/sites-available/${domain}.conf"
  a2ensite ${domain}.conf -q
fi

if [[ ! -d ${vm_dir}/public_html ]]; then
    echo "Creating ${vm_dir}/public_html"
    mkdir -p ${vm_dir}/public_html
fi
