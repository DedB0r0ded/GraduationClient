import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  TableModelColumn{ display: Russian.tableHeaders.globalFacilityComponentName }

  rows: [
    {
      name: Russian.placeholders.componentName
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
