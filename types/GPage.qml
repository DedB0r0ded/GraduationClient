import QtQuick
import QtQuick.Controls
import '../config'
import '../dialogs'
import 'basic'

FocusScope {
  id: _root; focus: true
  property int groupIndex: -1
  property int index: -1
  x: parent.width / Controls.menuWidthRatio
  width: parent.width / Controls.pageWidthRatio
  height: parent.height
  property alias border: _bg.border
  signal drawnIncorrectly

  GCanvas{ id: _bg }

  onHeightChanged: drawnIncorrectly()

  InfoDialog{
    id: _info
    anchors.centerIn: Overlay.overlay
  }

  GIconButton{
    anchors{
      right: parent.right
      bottom: parent.bottom
      rightMargin: 10
      bottomMargin: 10
    }
    opacity: 10
    lightIconSource: "qrc:///images/questionMarkLight.png"
    darkIconSource: "qrc:///images/questionMarkDark.png"
    width: 30
    height: width

    onClicked: {
      _info.open()
    }
  }
}
