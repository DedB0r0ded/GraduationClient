import QtQuick
import '../config'
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

}
