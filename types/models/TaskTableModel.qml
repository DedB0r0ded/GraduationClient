import Qt.labs.qmlmodels
import '../../strings'

TableModel{
  id: _model

  TableModelColumn{ display: Russian.tableHeaders.taskCreatorFullName }
  TableModelColumn{ display: Russian.tableHeaders.taskOrganisationName }
  TableModelColumn{ display: Russian.tableHeaders.taskSubject }
  TableModelColumn{ display: Russian.tableHeaders.taskExpiresOn }
  TableModelColumn{ display: Russian.tableHeaders.taskCompleted }

  rows: [
    {
      userFullName: Russian.placeholders.userFullName,
      organisationName: Russian.placeholders.organisationName,
      subject: Russian.placeholders.shortText,
      expiresOn: Russian.placeholders.date,
      completed: false,
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
