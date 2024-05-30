import QtQuick
import QtQuick.Controls
import '../config'
import 'basic'

ComboBox{
  id: _root
  model: ["TEXT_1", "TEXT_2", "TEXT_3"]
  padding: 10

  delegate: ItemDelegate{
    id: _delegate

    required property var model
    required property int index

    topInset: 0; bottomInset: 0
    leftInset: 0; rightInset: 0
    padding: 10

    width: _root.width
    contentItem: Text{
      font: _text.font
      text: _delegate.model[_root.textRole]
      color: _text.color
      elide: Text.ElideRight
      verticalAlignment: Text.AlignVCenter
    }

    background: GCanvas{
      width: _delegate.width
      height: _delegate.height
      color: _delegate.bgcolor()
    }

    highlighted: _root.highlightedIndex === index

    function bgcolor(){
      if(hovered && !down)
        return CurrentColorScheme.value.control.background.hover
      else if(down || activeFocus)
        return CurrentColorScheme.value.control.background.active
      else
        return CurrentColorScheme.value.control.background.idle
    }
  }


  contentItem: Text{
    id: _text
    color: CurrentColorScheme.value.control.text.idle
    font{
      pointSize: FontProperties.standartTextSize
      weight: FontProperties.standartTextWeight
    }
    text: _root.displayText
  }


  indicator: Canvas{
    id: _indicator
    x: _root.width - width - _root.rightPadding
    y: _root.topPadding + (_root.availableHeight - height) / 2
    width: 12
    height: 8
    contextType: "2d"

    Connections{
      target: _root
      function onPressedChanged() { _indicator.requestPaint() }
    }

    onPaint: {
      context.reset()
      context.moveTo(0, 0)
      context.lineTo(width, 0)
      context.lineTo(width/2, height)
      context.closePath()
      context.fillStyle = _root.pressed
          ? CurrentColorScheme.value.control.text.active
          : CurrentColorScheme.value.control.text.idle
      context.fill()
    }
  }

  background: GCanvas{
    width: parent.width
    height: parent.height
    color: parent.pressed
           ? CurrentColorScheme.value.control.background.active
           : CurrentColorScheme.value.control.background.idle
    border.width: 1
    border.color: parent.visualFocus ? CurrentColorScheme.value.control.text.idle : 'transparent'
  }
}
