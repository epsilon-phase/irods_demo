#!/usr/bin/bash

# log in so we can grab the up to date irods lol
echo "bison.europa.renci.org
1247
rods
tempZone
rods
" | iinit

# Grab the temporary files.
iget -r  /tempZone/home/rods/ub20packages_for_violet/ubuntu-20.04
dpkg -i ubuntu-20.04/irods-server_4.3.0-1~focal_amd64.deb
dpkg -i ubuntu-20.04/irods-runtime_4.3.0-1~focal_amd64.deb
dpkg -i ubuntu-20.04/irods-dev_4.3.0-1~focal_amd64.deb
dpkg -i ubuntu-20.04/irods-database-plugin-postgres_4.3.0-1~focal_amd64.deb
