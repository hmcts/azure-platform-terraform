#!/bin/bash
set -e
# Example 
# ENV="sbox"
# SUBSCRIPTION_ID="123-123-123-123"
# RESOURCE_GROUP="tamops-sbox-rg"
# PRIVATE_DNS_ZONE="service.core-compute-tamops.internal"
ENV=""
SUBSCRIPTION_ID=""
RESOURCE_GROUP=""
PRIVATE_DNS_ZONE=""

PRODUCTS=()
COMPONENTS=()
PRODUCTS+=($(yq e '.gateways[].app_configuration[].product' "../../environments/sbox/backend_lb_config.yaml"))
COMPONENTS+=($(yq e '.gateways[].app_configuration[].component' "../../environments/sbox/backend_lb_config.yaml"))

for i in "${!PRODUCTS[@]}"; do

product_component=("${PRODUCTS[i]}"-"${COMPONENTS[i]}"-"$ENV")

terraform import module.privatedns.azurerm_private_dns_a_record.this[\"$product_component\"]  /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Network/privateDnsZones/$PRIVATE_DNS_ZONE/A/$product_component

done

