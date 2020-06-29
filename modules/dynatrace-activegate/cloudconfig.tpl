#cloud-config
package_upgrade: true

runcmd:
 - 'wget -O /opt/Dynatrace-ActiveGate-Linux-x86-latest.sh "https://${dynatrace_instance_name}.live.dynatrace.com/api/v1/deployment/installer/gateway/unix/latest?arch=x86&flavor=default" --header="Authorization: Api-Token ${api_key}"'
 - sh /opt/Dynatrace-ActiveGate-Linux-x86-latest.sh --set-network-zone=${network_zone}