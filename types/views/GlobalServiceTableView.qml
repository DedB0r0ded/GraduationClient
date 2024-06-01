import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  TableModelColumn{ display: Russian.tableHeaders.globalServiceName}
  TableModelColumn{ display: Russian.tableHeaders.globalServiceDefaultFacility}
  TableModelColumn{ display: Russian.tableHeaders.globalServiceDefaultComponent}

  rows:[
    {
      name: Russian.placeholders.serviceName,
      defaultFacilityName: Russian.placeholders.facilityName,
      defaultComponentName: Russian.placeholders.componentName,
    }
  ]

  Component.onCompleted: {
    fetchModel()
  }

  function fetchModel(){
    // clear()
    // C++ REST
    return 0
  }
}
