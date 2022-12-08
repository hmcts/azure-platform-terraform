#cloud-config for private ActiveGate synthethic monitoring
package_upgrade: true

runcmd:
 - apt-get update
 - 'wget -O /opt/Dynatrace-ActiveGate-Linux-x86-latest.sh "https://${dynatrace_instance_name}.live.dynatrace.com/api/v1/deployment/installer/gateway/unix/latest?arch=x86&flavor=default" --header="Authorization: Api-Token ${paas_token}"'
 - sh /opt/Dynatrace-ActiveGate-Linux-x86-latest.sh --set-network-zone=${network_zone} --enable-synthetic
 - sed -i 's/^UMASK.*/UMASK 027/' /etc/login.defs