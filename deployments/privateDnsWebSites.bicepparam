using '../modules/network/private-dns-zone/main.bicep'

param name = 'privatelink.azurewebsites.net'

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
