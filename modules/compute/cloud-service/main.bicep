metadata name = 'Cloud Services'
metadata description = 'This module deploys a Cloud Services.'

@description('Required. The name of the Cloud Service that is being created.')
param name string

@description('Optional. Resource location.')
param location string = resourceGroup().location

@allowed([
  ''
  'CanNotDelete'
  'ReadOnly'
])
@description('Optional. Specify the type of lock.')
param lock string = ''

@description('Optional. Array of role assignment objects that contain the \'roleDefinitionIdOrName\' and \'principalId\' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: \'/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11\'.')
param roleAssignments array = []

@description('Optional. Tags of the cloud service resource.')
param tags object = {}

@description('Optional. Enable telemetry via a Globally Unique Identifier (GUID).')
param enableDefaultTelemetry bool = false

@description('Optional. Customer Usage Attribution ID (GUID). This GUID must be previously registered')
param cuaId string = ''

resource defaultTelemetry 'Microsoft.Resources/deployments@2021-04-01' = if (enableDefaultTelemetry) {
  name: !empty(cuaId) ? 'pid-${cuaId}' : 'pid-47ed15a6-730a-4827-bcb4-0fd963ffbd82-${uniqueString(deployment().name, location)}'
  properties: {
    mode: 'Incremental'
    template: {
      '$schema': 'https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#'
      contentVersion: '1.0.0.0'
      resources: []
    }
  }
}

//definición del cloud service

resource symbolicname 'Microsoft.Compute/cloudServices@2022-09-04' = {
  name: 'string'
  location: 'string'
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  properties: {
    allowModelOverride: bool
    configuration: 'string'
    configurationUrl: 'string'
    extensionProfile: {
      extensions: [
        {
          name: 'string'
          properties: {
            autoUpgradeMinorVersion: bool
            forceUpdateTag: 'string'
            protectedSettings: any()
            protectedSettingsFromKeyVault: {
              secretUrl: 'string'
              sourceVault: {
                id: 'string'
              }
            }
            publisher: 'string'
            rolesAppliedTo: [
              'string'
            ]
            settings: any()
            type: 'string'
            typeHandlerVersion: 'string'
          }
        }
      ]
    }
    networkProfile: {
      loadBalancerConfigurations: [
        {
          id: 'string'
          name: 'string'
          properties: {
            frontendIpConfigurations: [
              {
                name: 'string'
                properties: {
                  privateIPAddress: 'string'
                  publicIPAddress: {
                    id: 'string'
                  }
                  subnet: {
                    id: 'string'
                  }
                }
              }
            ]
          }
        }
      ]
      slotType: 'string'
      swappableCloudService: {
        id: 'string'
      }
    }
    osProfile: {
      secrets: [
        {
          sourceVault: {
            id: 'string'
          }
          vaultCertificates: [
            {
              certificateUrl: 'string'
            }
          ]
        }
      ]
    }
    packageUrl: 'string'
    roleProfile: {
      roles: [
        {
          name: 'string'
          sku: {
            capacity: int
            name: 'string'
            tier: 'string'
          }
        }
      ]
    }
    startCloudService: bool
    upgradeMode: 'string'
  }
  systemData: {}
  zones: [
    'string'
  ]
}

resource cloudService 'Microsoft.Compute/cloudServices@2022-09-04' = {
  name: name
  location: location
  tags: tags
  properties: {}

}

resource cloudService_lock 'Microsoft.Authorization/locks@2020-05-01' = if (!empty(lock)) {
  name: '${cloudService.name}-${lock}-lock'
  properties: {
    level: any(lock)
    notes: lock == 'CanNotDelete' ? 'Cannot delete resource or child resources.' : 'Cannot modify the resource or child resources.'
  }
  scope: cloudService
}

module cloudService_roleAssignments '.bicep/nested_roleAssignments.bicep' = [for (roleAssignment, index) in roleAssignments: {
  name: '${uniqueString(deployment().name, location)}-AvSet-Rbac-${index}'
  params: {
    description: contains(roleAssignment, 'description') ? roleAssignment.description : ''
    principalIds: roleAssignment.principalIds
    principalType: contains(roleAssignment, 'principalType') ? roleAssignment.principalType : ''
    roleDefinitionIdOrName: roleAssignment.roleDefinitionIdOrName
    condition: contains(roleAssignment, 'condition') ? roleAssignment.condition : ''
    delegatedManagedIdentityResourceId: contains(roleAssignment, 'delegatedManagedIdentityResourceId') ? roleAssignment.delegatedManagedIdentityResourceId : ''
    resourceId: cloudService.id
  }
}]

@description('The name of the cloud service.')
output name string = cloudService.name

@description('The resource ID of the cloud service.')
output resourceId string = cloudService.id

@description('The resource group the cloud service was deployed into.')
output resourceGroupName string = resourceGroup().name

@description('The location the resource was deployed into.')
output location string = cloudService.location
