import QtQuick
import QtQuick.Controls

import app.frius.stateManagement

import '../config'
import 'basic'

Button{
  id: _root

  required property string lightIconSource
  required property string darkIconSource

  readonly property int radiusModifier: 8

  property bool smoothIcon: true
  property bool mipmapIcon: false

  Image{
    width: parent.width * 0.6
    height: width
    anchors.centerIn: parent
    mipmap: _root.mipmapIcon
    smooth: _root.smoothIcon
    source: CurrentColorScheme.value.dark ? darkIconSource : lightIconSource
  }

  background: Rectangle{
    id: _bg
    anchors.fill: parent
    anchors.centerIn: parent

    radius: _root.radius()

    width: _root.width
    height: _root.height
    color: _root.bgcolor()
    border.width: 1
    border.color: _root.borderColor()
  }

  contentItem: Text{
    id: _text
    anchors.fill: parent
    anchors.centerIn: parent

    wrapMode: Text.WordWrap
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
  }

  onClicked: AppState.defaultIconButtonEcho()

  function radius(){
    if(!Controls.roundedIconButtons)
      return 0;
    if(_root.width > 128)
      return _root.width / radiusModifier / 2
    else
      return _root.width / radiusModifier
  }

  function bgcolor(){
    if(_root.hovered && !_root.down)
      return CurrentColorScheme.value.control.background.hover
    else if(_root.down)
      return  CurrentColorScheme.value.control.background.active
    else
      return  CurrentColorScheme.value.control.background.idle
  }

  function borderColor(){
    return _root.activeFocus ? CurrentColorScheme.value.stroke.active : 'transparent'
  }

  Component.onCompleted: {
    //console.log('src: ' + icon.source)
  }
}
