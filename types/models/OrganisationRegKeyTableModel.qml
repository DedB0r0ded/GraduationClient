import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  TableModelColumn{ display: Russian.tableHeaders.regKeyUserFullName }
  TableModelColumn{ display: Russian.tableHeaders.regKeyShortValue }

  rows: [
    {
      userFullName: Russian.placeholders.userFullName,
      shortValue: Russian.placeholders.regKeyShortValue,
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
