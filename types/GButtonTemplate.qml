import QtQuick
import QtQuick.Controls
import "./basic"

FocusScope{
  id: _root
  readonly property int radiusModifier: 32

  x: _bg.x; y: _bg.y
  width: _bg.width
  height: _bg.height
  property int minWidth
  property int minHeight

  readonly property int textWidth: _text.implicitWidth
  readonly property int textHeight: _text.implicitHeight

  property Item nextTabItem
  property Item previousTabItem

  property alias font: _text.font
  property alias text: _text.text
  property bool rounded: true
  property GColorSet colors
  property GColorTriplet borderColors

  signal clicked
  signal doubleClicked


  Button{
  id: _button
  focus: true
  padding: 0

  background: Rectangle{
    id: _bg
    implicitWidth: _funs.width()
    implicitHeight: _funs.height()
    color: _funs.bgcolor()
    radius: _funs.radius()
    border{
      color: _root.borderColors.active
      width: _funs.borderWidth()
    }
  }

  contentItem: Text{
    id: _text
    color: colors.text.idle
    anchors.fill: parent
    anchors.centerIn: parent
    wrapMode: Text.WordWrap
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
  }

  Keys.onEnterPressed: event => _funs.onClicked_default(event)
  onClicked: event => _funs.onClicked_default(event)
  onDoubleClicked: event => _funs.onDoubleClicked_default(event)
  onFocusChanged: if(focus) _button.forceActiveFocus()

  KeyNavigation.tab: _funs.nextTabItem()
  KeyNavigation.backtab: _funs.prevTabItem()
  }


  QtObject{
    id: _funs

    function width(){
      return Math.max(_root.minWidth, _text.implicitWidth)
    }

    function height(){
      return Math.max(_root.minHeight, _text.implicitHeight)
    }

    function bgcolor(){
      if(_button.hovered && !_button.down)
        return _root.colors.background.hover
      else if(_button.down || _button.activeFocus)
        return _root.colors.background.active
      else
        return _root.colors.background.idle
    }

    function radius(){
      if(!_root.rounded)
        return 0;
      if(_bg.implicitWidth > 128)
        return _bg.width / radiusModifier / 2
      else
        return _bg.width / radiusModifier
    }

    function borderWidth(){
      return 0
    }


    function onClicked_default(event){
      _root.clicked(event)
    }

    function onDoubleClicked_default(event){
      _root.doubleClicked(event)
    }

    function nextTabItem(){
      _root.nextTabItem.forceActiveFocus()
      return _root.nextTabItem
    }

    function prevTabItem(){
      _root.previousTabItem.forceActiveFocus()
      return _root.previousTabItem
    }
  }
}
