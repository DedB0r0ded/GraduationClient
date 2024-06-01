import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  TableModelColumn{ display: Russian.tableHeaders.globalBankName }
  TableModelColumn{ display: Russian.tableHeaders.globalBankAddress }
  TableModelColumn{ display: Russian.tableHeaders.globalBankRCBIC }

  rows: [
    {
      name: Russian.placeholders.bankName,
      address: Russian.placeholders.address,
      rcbic: Russian.placeholders.rcbic,
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
