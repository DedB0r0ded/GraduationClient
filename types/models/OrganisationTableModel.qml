import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  TableModelColumn{ display: Russian.tableHeaders.organisationName }
  TableModelColumn{ display: Russian.tableHeaders.organisationAddress }
  TableModelColumn{ display: Russian.tableHeaders.organisationTID }

  rows: [
    {
      name: Russian.placeholders.organisationName,
      address: Russian.placeholders.address,
      tid: Russian.placeholders.tid,
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
