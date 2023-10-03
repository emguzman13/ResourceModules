using '../modules/network/private-dns-zone/main.bicep'

param name = 'privatelink.blob.core.windows.net'

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
