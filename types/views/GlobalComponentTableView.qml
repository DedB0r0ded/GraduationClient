import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  // TODO: add warranty period if necessary
  TableModelColumn{ display: Russian.tableHeaders.globalComponentName }
  TableModelColumn{ display: Russian.tableHeaders.globalComponentManufacturer }
  TableModelColumn{ display: Russian.tableHeaders.globalComponentManufactureYear }
  TableModelColumn{ display: Russian.tableHeaders.globalComponentWarrantyPeriod }

  rows:[
    {
      name: Russian.placeholders.componentName,
      manufacturer: Russian.placeholders.manufactureYear,
      manufactureYear: Russian.placeholders.manufactureYear,
      warrantyPeriod: Russian.placeholders.warrantyPeriod,
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
