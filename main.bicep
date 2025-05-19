
---

## 📄 `main.bicep` (optional wrapper)

```bicep
param location string = resourceGroup().location

module wb './workbook.bicep' = {
  name: 'deployWorkbook'
  params: {
    location: location
  }
}

module dash './dashboard.bicep' = {
  name: 'deployDashboard'
  params: {
    location: location
    workbookResourceId: wb.outputs.workbookId
  }
}
