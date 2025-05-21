param location string = resourceGroup().location
param workbookName string = '4675e660-3b8f-42ea-83e6-52ba83714d97'
param workbookDisplayName string = 'AKS Cost by Namespace AJS'

resource workbook 'Microsoft.Insights/workbooks@2020-10-20' = {
  name: workbookName
  location: location
  kind: 'shared'  // ≡ƒöº Required to avoid 'Value cannot be null' error
  properties: {
    displayName: workbookDisplayName
    serializedData: '''
{
  "version": "Notebook/1.0",
  "items": [
    {
      "type": 1,
      "content": {
        "json": "## AKS Cost by Namespace"
      },
      "name": "title"
    },
    {
      "type": 3,
      "content": {
        "query": {
          "version": "KqlItem/1.0",
          "query": "Usage\\n| where kubernetesNamespace != \\\"\\\"\\n| summarize TotalCost = sum(PreTaxCost) by bin(UsageDateTime, 1d), kubernetesNamespace, kubernetesClusterName, meterCategory\\n| project Date=UsageDateTime, Cluster=kubernetesClusterName, Namespace=kubernetesNamespace, Meter=meterCategory, Cost=round(TotalCost, 2)",
          "resourceType": "microsoft.costmanagement",
          "visualization": "table"
        }
      },
      "name": "query"
    }
  ]
}
'''
    category: 'costinsights'
    sourceId: subscription().id
    version: '1.0'
  }
}

output workbookId string = workbook.id

