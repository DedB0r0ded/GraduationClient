import QtQuick
import '../../strings'

ListModel{
  id: _model

  ListElement{
    userFirstName: Russian.placeholders.userFirstName
    subject: Russian.placeholders.shortText
    body: Russian.placeholders.longText
    rating: 4
  }

  Component.onCompleted: {
    clear()
    getReviews()
  }

  function getReviews(){
    return null;
  }
}
