import QtQuick
import '../config'

FocusScope {

  Rectangle{
    id: _bg
    anchors{
      fill: parent
      centerIn: parent
    }
    color: CurrentColorScheme.value.canvas
    focus: false
  }
}
