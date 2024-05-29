import QtQuick
import QtQuick.Controls
import '../config'
import 'basic'

ComboBox{
  id: _root
  model: ["TEXT_1", "TEXT_2", "TEXT_3"]

  delegate: ItemDelegate{
    id: _delegate

    required property var model
    required property int index

    topInset: 0; bottomInset: 0
    leftInset: 0; rightInset: 0
    padding: 0

    width: _root.width
    contentItem: Text{
      font: _root.font
      text: _delegate.model[_root.textRole]
      elide: Text.ElideRight
      verticalAlignment: Text.AlignVCenter
    }

    background: GCanvas{
      width: _delegate.width
      height: _delegate.height
      color: _delegate.bgcolor()
    }

    function bgcolor(){
      if(hovered && !down)
        return CurrentColorScheme.value.control.background.hover
      else if(down || activeFocus)
        return CurrentColorScheme.value.control.background.active
      else
        return CurrentColorScheme.value.control.background.idle
    }
  }



}
