import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  TableModelColumn{ display: Russian.tableHeaders.organisationServiceName }
  TableModelColumn{ display: Russian.tableHeaders.organisationServiceCost }
  TableModelColumn{ display: Russian.tableHeaders.organisationServiceDefaultFacility }

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
