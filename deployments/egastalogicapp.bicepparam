using '../modules/storage/storage-account/main.bicep'

param name = 'egastalogicapp'

param kind = 'StorageV2'

param skuName = 'Standard_LRS'

param publicNetworkAccess = 'Disabled'

param privateEndpoints = [
  {
    subnetResourceId: '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-hub/subnets/private-endpoint'
    service: 'blob'
    PrivateDnsZoneGroup: {
      privateDNSResourceIds: [
        '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net'
      ]
    }
  }
  {
    subnetResourceId: '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-hub/subnets/private-endpoint'
    service: 'table'
    PrivateDnsZoneGroup: {
      privateDNSResourceIds: [
        '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/privateDnsZones/privatelink.table.core.windows.net'
      ]
    }
  }
  {
    subnetResourceId: '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-hub/subnets/private-endpoint'
    service: 'queue'
    PrivateDnsZoneGroup: {
      privateDNSResourceIds: [
        '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/privateDnsZones/privatelink.queue.core.windows.net'
      ]
    }
  }
  {
    subnetResourceId: '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-hub/subnets/private-endpoint'
    service: 'file'
    PrivateDnsZoneGroup: {
      privateDNSResourceIds: [
        '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/privateDnsZones/privatelink.file.core.windows.net'
      ]
    }
  }
]

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
