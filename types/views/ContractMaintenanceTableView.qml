import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  TableModelColumn{ display: Russian.tableHeaders.contractMaintenanceLastDate }
  TableModelColumn{ display: Russian.tableHeaders.contractMaintenanceNextDate }
  TableModelColumn{ display: Russian.tableHeaders.contractMaintenanceNextChangeDate }
  TableModelColumn{ display: Russian.tableHeaders.contractMaintenanceObject }

  rows: [
    {
      lastMaintenance: Russian.placeholders.date,
      nextMaintenance: Russian.placeholders.date,
      nextChange: Russian.placeholders.date,
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
