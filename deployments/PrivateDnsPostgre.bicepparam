using '../modules/network/private-dns-zone/main.bicep'

param name = 'postgres.database.azure.com'

param virtualNetworkLinks = [
  {
    registrationEnabled: false
    virtualNetworkResourceId: '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-hub'
  }
]

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
