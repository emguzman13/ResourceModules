using '../modules/network/private-dns-zone/main.bicep'

param name = 'privatelink.file.core.windows.net'

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
