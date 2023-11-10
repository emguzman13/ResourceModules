using '../modules/web/site/main.bicep'

param name = 'ega-logic-site'

param kind = 'functionapp,workflowapp'

param serverFarmResourceId = '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-cloudservices/providers/Microsoft.Web/serverfarms/ega-logic-asp'

param storageAccountResourceId = '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-cloudservices/providers/Microsoft.Storage/storageAccounts/egastalogicapp'

param virtualNetworkSubnetId = '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-hub/subnets/logicapp'

param privateEndpoints = [
  {
    subnetResourceId: '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-hub/subnets/private-endpoint'
    service: 'sites'
    PrivateDnsZoneGroup: {
      privateDNSResourceIds: [
        '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/privateDnsZones/privatelink.azurewebsites.net'
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
