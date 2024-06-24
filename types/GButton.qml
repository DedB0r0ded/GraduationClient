import QtQuick
import QtQuick.Controls

import app.frius.stateManagement

import '../config'
import 'basic'

Button{
  id: _root

  property bool dangerous: false
  readonly property int radiusModifier: 8
  property int textSize: FontProperties.buttonTextSize

  background: Rectangle{
    id: _bg
    anchors.fill: parent
    anchors.centerIn: parent

    radius: _root.radius()

    width: _root.width
    height: _root.height
    color: _root.bgcolor()
  }

  contentItem: Text{
    id: _text
    text: _root.text
    anchors.fill: parent
    anchors.centerIn: parent
    color: _root.fgcolor()

    font.pointSize: _root.textSize
    font.weight: FontProperties.buttonTextWeight
    wrapMode: Text.WordWrap
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
  }

  onClicked: AppState.defaultButtonEcho()

  function radius(){
    if(!Controls.roundedButtons)
      return 0;
    if(_root.width > 128)
      return _root.width / radiusModifier / 2
    else
      return _root.width / radiusModifier
  }

  function bgcolor(){
    if(!dangerous){
      if(_root.hovered && !_root.down)
        return CurrentColorScheme.value.control.background.hover
      else if(_root.down)
        return  CurrentColorScheme.value.control.background.active
      else
        return  CurrentColorScheme.value.control.background.idle
    }
    else{
      if(_root.hovered && !_root.down)
        return CurrentColorScheme.value.danger.background.hover
      else if(_root.down)
        return  CurrentColorScheme.value.danger.background.active
      else
        return  CurrentColorScheme.value.danger.background.idle
    }
  }

  function fgcolor(){
    if(dangerous)
      return CurrentColorScheme.value.danger.text.idle
    return CurrentColorScheme.value.control.text.idle
  }

  Component.onCompleted: {
    //console.log('src: ' + icon.source)
  }
}
