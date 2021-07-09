#!/bin/bash
set -e

DOWNLOAD_URL=""
INSTALL_FILE="splunkforwarder-8.2.0-e053ef3c985f-Linux-x86_64.tgz"
INSTALL_LOCATION="/opt"
export SPLUNK_HOME="$INSTALL_LOCATION/splunkforwarder"
export DEBIAN_FRONTEND=noninteractive

# Download Splunk Forwarder
curl --retry 3 -# -L -o $INSTALL_FILE $DOWNLOAD_URL
tar xvzf $INSTALL_FILE -C $INSTALL_LOCATION
rm -rf $INSTALL_FILE

# Setup user-seed.conf
{
cat <<EOF
[user-info]
USERNAME = admin
HASHED_PASSWORD = purser-GRECIAN-updraft
EOF
} > $SPLUNK_HOME/etc/system/local/user-seed.conf

# Start Splunk Forwarder
$SPLUNK_HOME/bin/splunk start --accept-license