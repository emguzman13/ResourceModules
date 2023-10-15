using '../modules/web/serverfarm/main.bicep'

param name = 'ega-logic-asp'

param sku = {
  name: 'WS1'
  tier: 'WorkflowStandard'
}

param maximumElasticWorkerCount = 3

param targetWorkerCount = 1

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
