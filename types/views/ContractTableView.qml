import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  TableModelColumn{ display: Russian.tableHeaders.contractCustomerName }
  TableModelColumn{ display: Russian.tableHeaders.contractContractorName }
  TableModelColumn{ display: Russian.tableHeaders.contractConclusionDate }
  TableModelColumn{ display: Russian.tableHeaders.contractExpirationDate }
  TableModelColumn{ display: Russian.tableHeaders.contractContinuous }

  rows: [
    {
      customerName: Russian.placeholders.organisationName,
      contractorName: Russian.placeholders.organisationName,
      conclusionDate: Russian.placeholders.date,
      expirationDate: Russian.placeholders.date,
      continuous: false,
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
