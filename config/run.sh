#!/bin/bash

if [ -e /config/eduroam ]
then
    echo "The Eduroam File is present."
    cp /config/eduroam /etc/raddb/sites-available/
    ln -s /etc/raddb/sites-available/eduroam /etc/raddb/sites-enabled/eduroam
    # We no longer need the default site.
    rm /etc/raddb/sites-enabled/default
fi

if [ -e /config/clients.conf ]
then
    echo "The clients file is present."
    cp /config/clients.conf /etc/raddb/
fi

if [ -e /config/pre-proxy ]
then
    echo "The pre-proxy file is present."
    cp /config/pre-proxy /etc/raddb/mods-config/attr_filter/
fi

if [ -e /config/proxy.conf ]
then
    echo "The proxy.conf file is present."
    cp /config/proxy.conf /etc/raddb/
fi

echo "Fixing permissions on the /var/log/radius directory."
chown -R radius:radius /var/log/radius
echo "Starting Radius..."
/usr/sbin/radiusd -f

