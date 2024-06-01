import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  TableModelColumn{ display: Russian.tableHeaders.globalManufacturerName }
  TableModelColumn{ display: Russian.tableHeaders.globalManufacturerCountry }
  TableModelColumn{ display: Russian.tableHeaders.globalManufacturerCode }

  rows: [
    {
      name: Russian.placeholders.manufacturerName,
      country: Russian.placeholders.country,
      code: Russian.placeholders.manufacturerCode,
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
