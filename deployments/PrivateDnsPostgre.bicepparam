using '../modules/network/private-dns-zone/main.bicep'

param name = 'postgres.database.azure.com'

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
