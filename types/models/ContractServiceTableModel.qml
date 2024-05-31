import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  TableModelColumn{ display: Russian.tableHeaders.contractServiceName }
  TableModelColumn{ display: Russian.tableHeaders.contractServiceCost }
  TableModelColumn{ display: Russian.tableHeaders.contractServiceObject }

  rows: [
    {
      name: Russian.placeholders.serviceName,
      cost: 99999,
      object: Russian.placeholders.facilityName,
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
