#cloud-config
package_upgrade: true

runcmd:
 - apt-get update
 - apt-get -y install xvfb x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable
 - apt-get -y install libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6:amd64 libcairo2 libcups2 libgdk-pixbuf2.0-0 libgtk-3-0 libnspr4 libnss3 libxss1 xdg-utils
 - curl --output chromium.tgz https://synthetic-packages.s3.amazonaws.com/Chromium/deb/chromium-89.0.4389.82-0ubuntu0.18.04.1.tgz
 - mkdir /tmp/chromium ; tar xzf chromium.tgz -C /tmp/chromium
 - dpkg -i /tmp/chromium/*.deb
 - echo "chromium-browser hold" | dpkg --set-selections  
 - echo "chromium-codecs-ffmpeg-extra hold" | dpkg --set-selections
 - 'wget -O /opt/Dynatrace-ActiveGate-Linux-x86-latest.sh "https://${dynatrace_instance_name}.live.dynatrace.com/api/v1/deployment/installer/gateway/unix/latest?arch=x86&flavor=default" --header="Authorization: Api-Token ${paas_token}"'
 - sh /opt/Dynatrace-ActiveGate-Linux-x86-latest.sh --enable-synthetic=manual