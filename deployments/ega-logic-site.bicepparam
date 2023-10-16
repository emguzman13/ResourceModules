using '../modules/web/site/main.bicep'

param name = 'ega-logic-site'

param kind = 'functionapp,workflowapp'

param serverFarmResourceId = '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-apps/providers/Microsoft.Web/serverFarms/ega-logic-asp'

param storageAccountResourceId = '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-apps/providers/Microsoft.Storage/storageAccounts/egastalogicapp'

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
  appSettings: [
    {
      FUNCTIONS_EXTENSION_VERSION: '~4'
    }
  ]
  functionsRuntimeScaleMonitoringEnabled: false
}

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
