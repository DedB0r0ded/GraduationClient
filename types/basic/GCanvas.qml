import QtQuick
import '../../config'

Rectangle{
  width: parent.width; height: parent.height
  focus: false
  anchors{
    fill: parent
    centerIn: parent
  }

  color: CurrentColorScheme.value.canvas
}
