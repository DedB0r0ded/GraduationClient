import QtQuick

ListModel{
  id: _model

  ListElement{
    userFirstName: "FIRST_NAME"
    subject: "Lorem ipsum dolor sit amet..."
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit." +
      "Nullam lectus purus, suscipit eget tortor ac, pellentesque blandit leo." +
      "Sed eget tellus a neque pharetra lobortis ut et leo. Nunc elementum."
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
