import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  TableModelColumn{ display: Russian.tableHeaders.taskCreatorFullName }
  TableModelColumn{ display: Russian.tableHeaders.taskOrganisationName }

  rows: [
    {
      name: Russian.placeholders.userFullName,
      granted: false,
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
