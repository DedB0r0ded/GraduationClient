import QtQuick
import QtQuick.Controls
import 'basic'
import '../config'

TextField {
  id: _root
  focus: true
  padding: 5
  maximumLength: 24
  font{
    pointSize: FontProperties.smallTextSize
    weight: FontProperties.plainTextWeight
  }

  color: CurrentColorScheme.value.input.text.idle
  background: Rectangle{
    id: _bg
    color: CurrentColorScheme.value.input.background.idle
    border{
      width: 1
      color: _root.borderColor()
    }
  }
  cursorDelegate: GCursor{ cursorAnimationPeriod: 400 }


  function borderColor(){
    if(activeFocus)
      return CurrentColorScheme.value.stroke.active
    else if(acceptableInput)
      return CurrentColorScheme.value.stroke.idle
    else
      return CurrentColorScheme.value.danger.text.hover
  }
}
