#!/bin/bash
set -e

DOWNLOAD_URL="https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.2.0&product=universalforwarder&filename=splunkforwarder-8.2.0-e053ef3c985f-Linux-x86_64.tgz&wget=true"
INSTALL_FILE="splunkforwarder-8.2.0-e053ef3c985f-Linux-x86_64.tgz"
INSTALL_LOCATION="/opt"
KEYVAULT="soc-prod"
UF_USERNAME_KV_SECRET="splunk-gui-admin-username"
UF_PASSWORD_KV_SECRET="splunk-gui-admin-password"

export SPLUNK_HOME="$INSTALL_LOCATION/splunkforwarder"
export DEBIAN_FRONTEND=noninteractive

# Retrieve secrets
TOKEN_REQUEST="$(curl -s 'http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https%3A%2F%2Fvault.azure.net' -H Metadata:true)"
ACCESS_TOKEN="$(echo $TOKEN_REQUEST | cut -d \" -f 4)"
UF_USERNAME_REQUEST="$(curl -s "https://$KEYVAULT.vault.azure.net/secrets/$UF_USERNAME_KV_SECRET?api-version=2016-10-01" -H "Authorization: Bearer $ACCESS_TOKEN")"
UF_USERNAME="$(echo $UF_USERNAME_REQUEST | cut -d \" -f 4)"

UF_PASSWORD_REQUEST="$(curl -s "https://$keyvault.vault.azure.net/secrets/$UF_PASSWORD_KV_SECRET?api-version=2016-10-01" -H "Authorization: Bearer $ACCESS_TOKEN")"
UF_PASSWORD="$(echo $UF_UF_PASSWORD_REQUEST | cut -d \" -f 4)"



# Install Splunk Forwarder
curl --retry 3 -# -L -o $INSTALL_FILE $DOWNLOAD_URL
tar xvzf $INSTALL_FILE -C $INSTALL_LOCATION
rm -rf $INSTALL_FILE

# Start Splunk Forwarder
$SPLUNK_HOME/bin/splunk start --accept-license --no-prompt

# Create Splunk admin user
{
cat <<EOF
[user-info]
USERNAME = $UF_USERNAME
HASHED_PASSWORD = $($SPLUNK_HOME/bin/splunk hash-passwd $UF_PASSWORD)
EOF
} > $SPLUNK_HOME/etc/system/local/user-seed.conf

$SPLUNK_HOME/bin/splunk stop
sleep 10
$SPLUNK_HOME/bin/splunk start

# Create boot-start systemd user
adduser --system --group splunk
chown -R splunk:splunk $SPLUNK_HOME


# Create boot-start systemd service
$SPLUNK_HOME/bin/splunk stop
sleep 10
$SPLUNK_HOME/bin/splunk enable boot-start -systemd-managed 1 -user splunk -group splunk
chown -R splunk:splunk $SPLUNK_HOME

$SPLUNK_HOME/bin/splunk start