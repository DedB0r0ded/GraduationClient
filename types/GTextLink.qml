import QtQuick

import "../strings"
import "../types"
import "../types/basic"
import "../config"
import "../colorSchemes"
import "../js"
import "../pages"

Text{
  property alias hovered: _area.containsMouse
  signal clicked
  padding: 0
  horizontalAlignment: Text.AlignHCenter
  verticalAlignment: Text.AlignVCenter
  font.pointSize: FontProperties.plainTextSize
  font.underline: true
  font.italic: true
  color: hovered
         ? CurrentColorScheme.value.ref.hover
         : CurrentColorScheme.value.ref.idle

  MouseArea{
    id: _area
    anchors{
      fill: parent
      centerIn: parent
    }
    hoverEnabled: true
    onClicked: parent.clicked()
  }
}
