using '../modules/network/private-dns-zone/main.bicep'

param name = 'privatelink.dfs.core.windows.net'

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
