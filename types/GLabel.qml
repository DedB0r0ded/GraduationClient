import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import '../config'

Label{
  property alias border: _bg.border
  property alias backgroundColor: _bg.color

  color: CurrentColorScheme.value.basic.text.idle

  verticalAlignment: Label.AlignVCenter
  horizontalAlignment: Label.AlignHCenter
  font{
    weight: FontProperties.standartTextWeight
    pointSize: FontProperties.standartTextSize
  }

  topInset: 0; bottomInset: 0
  padding: 0; Layout.margins: 0

  background: Rectangle{
    id: _bg
    anchors{
      fill: parent
      centerIn: parent
    }
    color: CurrentColorScheme.value.basic.background.idle
  }
  text: "TEXT"
}
