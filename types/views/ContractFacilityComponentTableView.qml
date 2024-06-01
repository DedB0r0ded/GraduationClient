import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  TableModelColumn{ display: Russian.tableHeaders.contractFacilityComponentName }
  TableModelColumn{ display: Russian.tableHeaders.contractFacilityComponentMaintained }

  rows: [
    {
      name: Russian.placeholders.componentName,
      maintained: false,
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
