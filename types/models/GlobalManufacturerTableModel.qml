import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  TableModelColumn{ display: Russian.tableHeaders.globalManufacturerName }
  TableModelColumn{ display: Russian.tableHeaders.globalManufacturerCode }

  rows: [
    {
      name: "MANUFACTURER_NAME"
      code: "CODE"
    }

  ]
}
