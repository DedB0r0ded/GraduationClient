import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  TableModelColumn{ display: Russian.tableHeaders.globalServiceName}
  TableModelColumn{ display: Russian.tableHeaders.globalServiceDefaultFacility}
  TableModelColumn{ display: Russian.tableHeaders.globalServiceDefaultComponent}

  rows:[
    {
      name: "SERVICE_NAME",
      defaultFacilityName: "FACILITY_NAME",
      defaultComponentName: "COMPONENT_NAME"
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
