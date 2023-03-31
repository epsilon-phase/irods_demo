#! /bin/bash -e
catalog_db_hostname=irods-catalog-s3

echo "Waiting for iRODS catalog database to be ready"

until pg_isready -h ${catalog_db_hostname} -d ICAT -U irods -q
do
    sleep 1
done

echo "iRODS catalog database is ready"

setup_input_file=/irods_setup.input

if [ -e "${setup_input_file}" ]; then
    echo "Running iRODS setup"
    python3 /var/lib/irods/scripts/setup_irods.py < "${setup_input_file}"
    rm /irods_setup.input
fi

echo "Starting server"

cd /usr/sbin
apt update
apt install --fix-broken -y
apt install  -y vim
su irods -c 'bash -c "./irodsServer -u"' &
echo rods >> /var/lib/irods/s3.keypair
echo "a good key" >> /var/lib/irods/s3.keypair
sleep 5
su irods -c iadmin mkresc s3resc s3 $(hostname):/bucket1 "S3_DEFAULT_HOSTNAME=irods-s3-bridge:8080;S3_AUTH_FILE=/var/lib/irods/s3.keypair;S3_REGIONNAME=us-east-1;S3_RETRY_COUNT=1;S3_WAIT_TIME_SECONDS=3;S3_PROTO=HTTP;ARCHIVE_NAMING_POLICY=consistent;HOST_MODE=cacheless_attached"
while true; do sleep 1; done
