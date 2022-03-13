# Migrating to Availability Zone-Enabled Access Gateway  

## Implementation (No downtime)

### Create AZ-enabled frontend/backend application gateway resources

- Identify available IP addresses for the new frontend and backend application gateways
- Update the environment <env>.tfvars file and add values for the below variables  
    
  `frontend_agw_private_ip_address = "<frontend ip address>"`
   `backend_agw_private_ip_address = ["<backend ip address>"]`  

- Create Azure DevOps pipeline stages for the new `frontendappgateway` and `backendappgateway` components. See [sbox pipeline stages example](https://github.com/hmcts/azure-platform-terraform/blob/master/azure_pipeline.yaml#L47-L61)
- Run [azure-platform-terraform pipeline](https://dev.azure.com/hmcts/CNP/_build?definitionId=235) `plan` and confirm the terraform plans for the new appgateway components are correct.  
  Also confirm there are no changes in the terraform plans for the existing `cftapps_cluster_lb` and `cftapps_cluster_lb_backend` appgateway components
- Run the [azure-platform-terraform](https://dev.azure.com/hmcts/CNP/_build?definitionId=235) pipeline `apply` to create the new `frontendappgateway` and `backendappgateway` components 

### Create Azure Firewall and Palo Alto entries

#### Azure Firewall  
- Update the environment [`.tfvars configuration file`](https://github.com/hmcts/rdo-terraform-hub-dmz/tree/1b47237e07a759fb05c74adf749e4749d8f88b8c/env_tfvars) and add an entry for the new `frontendappgateway`  
  See [sbox example](https://github.com/hmcts/rdo-terraform-hub-dmz/blob/1b47237e07a759fb05c74adf749e4749d8f88b8c/env_tfvars/hub-sbox-int.tfvars#L59-L66)  
  Note:   
  - name: Append `-2` suffix to the environment name (though sbox example shown uses a `-test` suffix)  
  - palo_ips: IP address for the new `frontendappgateway`. Specify same values for both uksouth and ukwest
  - index: Pick the next available number
  
#### Palo Alto
- Update the [`hub-pan-baseline.j2`](https://github.com/hmcts/rdo-terraform-hub-dmz/blob/master/modules/palo-alto/ansible/templates/hub-pan-baseline.j2) configuration file with the following
  - Locate the server object entry (`name/ip address`) for the current frontend application gateway. Directly below this entry, add a server object for the new `frontendappgateway` using a `-2` name suffix   
  - Locate the address group object entry (`<member>AKS-<env>-APPGW</member>`) for the current frontend application. Add an entry for server object created above 

See [Example PR](https://github.com/hmcts/rdo-terraform-hub-dmz/pull/549)

Upon merging PR for the changes above, confirm the [hmcts.rdo-terraform-hub-dmz](https://dev.azure.com/hmcts/PlatformOperations/_build?definitionId=226) pipeline run complete successfully without errors.
- Confirm the following were created in Azure Firewall in both uksouth and ukwest
  - A `public IP address` associated with the regional Azure firewall
  - A destination NAT `NAT rule collection` entry translating inbound traffic (from Azure Front Door) to the newly created public IP to `frontendappgateway' private IP address
- Confirm on the Palo Alto, the server and address group objects for the `frontendappgateway` were created


### Test frontendappgateway configuration
Prior to switching over traffic to the new application gateways, test the frontendappgateway by switching a single frontend application to route FrontDoor traffic through the new gateway

- In the environment [`.tfvars configuration file`](https://github.com/hmcts/rdo-terraform-hub-dmz/tree/1b47237e07a759fb05c74adf749e4749d8f88b8c/env_tfvars), identify a suitable frontend application to use for testing. Speak to application team where necessary to make them aware of testing
- Update the `backend domain` of the application above to the `DNS name` of the Azure Firewall public IP address created for the `frontendappgateway`.  
  See [Example PR](https://github.com/hmcts/azure-platform-terraform/pull/1042)
- 


### Create Azure Firewall and Palo Alto Entries for FrontEnd appgatewy