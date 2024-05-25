import QtQuick
import QtQuick.Controls
import "./basic"

Item{
  id: _root

  property int minWidth
  property int minHeight
  width: _button.width
  height: _button.height
  property bool hovered: _button.hovered
  property alias text: _text.text
  property GColorSet colors

  readonly property int radiusModifier: 32

  signal clicked
  signal doubleClicked

  Button{
    id: _button

    background: Rectangle{
      id: _bg
      implicitWidth: _funs.width()
      implicitHeight: _funs.height()
      color: _funs.bgcolor()
      radius: _funs.radius()
    }

    contentItem: Text{
      id: _text
      color: colors.text.idle
      wrapMode: Text.WordWrap
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
    }

    onClicked: event => _funs.onClicked_default(event)
    onDoubleClicked: event => _funs.onDoubleClicked_default(event)
  }

  QtObject{
    id: _funs

    function width(){
      if(_root.minWidth > _text.implicitWidth)
        return _root.minWidth
      else
        return _text.implicitWidth
    }

    function height(){
      if(_root.minHeight > _text.implicitHeight)
        return _root.minHeight
      else
        return _text.implicitHeight
    }

    function bgcolor(){
      console.log("Button color changed!")
      console.log(_root.colors.background.idle)
      console.log(_root.colors.background.hover)
      console.log(_root.colors.background.active)
      if(_button.hovered && !_button.down)
        return _root.colors.background.hover
      else if(_button.down)
        return _root.colors.background.active
      else
        return _root.colors.background.idle
    }

    function radius(){
      if(_bg.implicitWidth > 128)
        return _bg.width / radiusModifier / 2
      else
        return _bg.width / radiusModifier
    }

    function onClicked_default(event){
      _root.clicked(event)
    }

    function onDoubleClicked_default(event){
      _root.doubleClicked(event)
    }
  }
}
