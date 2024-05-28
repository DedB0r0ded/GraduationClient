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
    color: CurrentColorScheme.value.input.background.idle
    border{
      width: 1
      color: _root.activeFocus
        ? CurrentColorScheme.value.stroke.idle
        : CurrentColorScheme.value.stroke.active
    }
  }
  cursorDelegate: GCursor{ cursorAnimationPeriod: 400 }

}
