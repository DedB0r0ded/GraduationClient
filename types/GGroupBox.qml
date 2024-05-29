import QtQuick
import QtQuick.Controls
import 'basic'
import '../config'

GroupBox{
  id: _root
  padding: 40

  background: Rectangle{
    anchors.fill: parent
    anchors.centerIn: parent
    color: CurrentColorScheme.value.basic.background.idle
  }

  label: GLabel{
    x: parent.leftPadding
    font.weight: FontProperties.headerTextWeight
    width: _root.availableWidth
    text: _root.title
  }
}
