import QtQuick
import QtQuick.Controls
import '../config'
import './basic'

FocusScope {
  id: _root
  x: _textArea.x; y: _textArea.y
  width: _textArea.width; height: _textArea.height
  readonly property GColorSet colors: CurrentColorScheme.value.input

  signal editingFinished


  ScrollView{
    id: _scrollView
    anchors.centerIn: parent
    anchors.fill: parent

    TextArea{
      id: _textArea
      font{
        pointSize: FontProperties.plainTextSize
        weight: FontProperties.plainTextWeight
      }
      wrapMode: TextArea.Wrap
      onEditingFinished: _root.editingFinished()
    }
  }


}
