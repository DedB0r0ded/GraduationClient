import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import '../config'

Label{
  color: CurrentColorScheme.value.basic.text.idle
  verticalAlignment: Label.AlignVCenter
  horizontalAlignment: Label.AlignHCenter
  topInset: 0; bottomInset: 0
  padding: 0
  Layout.margins: 0
  font{
    weight: FontProperties.standartTextWeight
    pointSize: FontProperties.standartTextSize
  }
  background: Rectangle{
    anchors{
      fill: parent
      centerIn: parent
    }
    color: CurrentColorScheme.value.basic.background.idle
  }
  text: "TEXT"
}
