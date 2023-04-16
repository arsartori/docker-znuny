#!/bin/bash

# Change data connection
sed -i 's/\(.*{DatabaseHost}.*\)127.0.0.1/\1'"${DATABASE_HOST}"'/' /opt/otrs/Kernel/Config.pm
sed -i 's/\(.*{Database}.*\)otrs/\1'"otrs_${DATABASE}"'/' /opt/otrs/Kernel/Config.pm
sed -i 's/\(.*{DatabaseUser}.*\)otrs/\1'"${DB_USER}"'/' /opt/otrs/Kernel/Config.pm
sed -i 's/\(.*{DatabasePw}.*\)some-pass/\1'"${DB_PASS}"'/' /opt/otrs/Kernel/Config.pm

# Start Apache
service apache2 start

# Start cron
service cron start

# Start OTRS Daemon
su -c "/opt/otrs/bin/Cron.sh start" -s /bin/bash otrs
