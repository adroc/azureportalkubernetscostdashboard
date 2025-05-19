param location string = resourceGroup().location
param workbookName string = 'aks-cost-by-namespace-wb'
param workbookDisplayName string = 'AKS Cost by Namespace'

resource workbook 'Microsoft.Insights/workbooks@2020-10-20' = {
  name: workbookName
  location: location
  properties: {
    displayName: workbookDisplayName
    serializedData: loadTextContent('aks-cost-workbook.json')
    category: 'costinsights'
    sourceId: subscription().id
    version: '1.0'
    tags: {
      hidden-title: workbookDisplayName
    }
  }
}

output workbookId string = workbook.id
