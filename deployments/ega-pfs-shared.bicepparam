using '../modules/db-for-postgre-sql/flexible-server/main.bicep'

param name = 'ega-pfs-shared'

param skuName = 'Standard_D4ds_v4'

param tier = 'GeneralPurpose'

param administratorLogin = 'userLoginTest'

param administratorLoginPassword = az.getSecret('72d501de-5778-4b23-8a81-33abfd22d159', 'rg-security', 'ega-key-global', 'postgrePassword')

//param administratorLoginPassword = 'Pa$$w0rd12345'

param passwordAuth = 'Enabled'
param activeDirectoryAuth = 'Disabled'

param delegatedSubnetResourceId = '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-hub/subnets/postgre'

param privateDnsZoneArmResourceId = '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/privateDnsZones/private.postgres.database.azure.com'

param databases = [
  {
    charset: 'UTF8'
    collation: 'en_US.utf8'
    name: 'testdb1'
  }
  {
    name: 'testdb2'
  }
]

param storageSizeGB = 128

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
