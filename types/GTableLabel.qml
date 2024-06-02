import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import '../config'

GLabel{
  required property bool current
  required property bool selected

  color: CurrentColorScheme.value.basic.text.idle
  property color backgroundColor: bgcolor()

  elide: Text.ElideRight

  font{
    weight: FontProperties.plainTextWeight
    pointSize: FontProperties.plainTextSize
  }
  background: Rectangle{
    anchors{
      fill: parent
      centerIn: parent
    }
    color: parent.backgroundColor
  }
  text: "CELL"


  function bgcolor(){
    if(current || selected)
      return CurrentColorScheme.value.input.background.active
    if(selected)
      return CurrentColorScheme.value.input.background.active
    return CurrentColorScheme.value.input.background.idle
  }
}
