using '../modules/web/site/main.bicep'

param name = 'ega-logic-private-001'

param kind = 'functionapp,workflowapp'

param serverFarmResourceId = '/subscriptions/bc71ff3d-b09c-4a79-9db1-1701ff8dc2e0/resourceGroups/rg-logicapp/providers/Microsoft.Web/serverFarms/ega-logic-asp'

param storageAccountResourceId = '/subscriptions/bc71ff3d-b09c-4a79-9db1-1701ff8dc2e0/resourceGroups/rg-logicapp/providers/Microsoft.Storage/storageAccounts/egastalogitest'

param virtualNetworkSubnetId = '/subscriptions/bc71ff3d-b09c-4a79-9db1-1701ff8dc2e0/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-001/subnets/logicapp'

param storageAccountRequired = true

param privateEndpoints = [
  {
    subnetResourceId: '/subscriptions/bc71ff3d-b09c-4a79-9db1-1701ff8dc2e0/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-001/subnets/privateendpoint'
    service: 'sites'
    PrivateDnsZoneGroup: {
      privateDNSResourceIds: [
        '/subscriptions/bc71ff3d-b09c-4a79-9db1-1701ff8dc2e0/resourceGroups/rg-dns/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net'
      ]
    }
  }
]

param siteConfig = {
  functionsRuntimeScaleMonitoringEnabled: false
}

param appSettingsKeyValuePairs = {
  //WEBSITE_DNS_SERVER: '10.16.0.104'
  FUNCTIONS_EXTENSION_VERSION: '~4'
}

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
