import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  // TODO: add warranty period if necessary
  TableModelColumn{ display: Russian.tableHeaders.globalFacilityName }
  TableModelColumn{ display: Russian.tableHeaders.globalFacilityManufacturer }
  TableModelColumn{ display: Russian.tableHeaders.globalFacilityManufactureYear }
  TableModelColumn{ display: Russian.tableHeaders.globalFacilityWarrantyPeriod }

  rows:[
    {
      name: Russian.placeholders.facilityName,
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
