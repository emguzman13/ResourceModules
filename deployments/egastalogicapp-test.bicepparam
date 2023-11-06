using '../modules/storage/storage-account/main.bicep'

param name = 'egastalogitest'

param kind = 'StorageV2'

param skuName = 'Standard_LRS'

param publicNetworkAccess = 'Disabled'

param privateEndpoints = [
  {
    subnetResourceId: '/subscriptions/bc71ff3d-b09c-4a79-9db1-1701ff8dc2e0/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-001/subnets/privateendpoint'
    service: 'blob'
    PrivateDnsZoneGroup: {
      privateDNSResourceIds: [
        '/subscriptions/bc71ff3d-b09c-4a79-9db1-1701ff8dc2e0/resourceGroups/rg-dns/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net'
      ]
    }
  }
  {
    subnetResourceId: '/subscriptions/bc71ff3d-b09c-4a79-9db1-1701ff8dc2e0/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-001/subnets/privateendpoint'
    service: 'table'
    PrivateDnsZoneGroup: {
      privateDNSResourceIds: [
        '/subscriptions/bc71ff3d-b09c-4a79-9db1-1701ff8dc2e0/resourceGroups/rg-dns/providers/Microsoft.Network/privateDnsZones/privatelink.table.core.windows.net'
      ]
    }
  }
  {
    subnetResourceId: '/subscriptions/bc71ff3d-b09c-4a79-9db1-1701ff8dc2e0/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-001/subnets/privateendpoint'
    service: 'queue'
    PrivateDnsZoneGroup: {
      privateDNSResourceIds: [
        '/subscriptions/bc71ff3d-b09c-4a79-9db1-1701ff8dc2e0/resourceGroups/rg-dns/providers/Microsoft.Network/privateDnsZones/privatelink.queue.core.windows.net'
      ]
    }
  }
  {
    subnetResourceId: '/subscriptions/bc71ff3d-b09c-4a79-9db1-1701ff8dc2e0/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-001/subnets/privateendpoint'
    service: 'file'
    PrivateDnsZoneGroup: {
      privateDNSResourceIds: [
        '/subscriptions/bc71ff3d-b09c-4a79-9db1-1701ff8dc2e0/resourceGroups/rg-dns/providers/Microsoft.Network/privateDnsZones/privatelink.file.core.windows.net'
      ]
    }
  }
]

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
