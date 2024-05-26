import QtQuick
import QtQuick.Controls
import '../config'
import './basic'

Item {
  id: _root
  readonly property GColorSet colors: CurrentColorScheme.input

  signal editingFinished

  ScrollView{
    id: _scrollView
    anchors.centerIn: parent
    anchors.fill: parent
    TextArea{
      id: _textArea
      font.pointSize: FontProperties.plainTextSize
      onEditingFinished: _root.editingFinished()
    }
  }


}
