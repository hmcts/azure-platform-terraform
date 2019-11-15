#!/bin/bash

echo "Terraform configuration move started!"

while read -r line; do terraform state mv $line module.public-dns."$line";  done < ithc.platform.hmcts.net-managed-resources.txt

echo "Terraform configuration move completed!"