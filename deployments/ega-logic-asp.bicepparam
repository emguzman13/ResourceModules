using '../modules/web/serverfarm/main.bicep'

param name = 'ega-logic-asp'

param sku = {
  name: 'WS1'
  tier: 'WorkflowStandard'
}

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
