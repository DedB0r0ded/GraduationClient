import QtQuick
import QtQuick.Controls
import '../../config'

Rectangle{
  id: _cursor
  property int cursorAnimationPeriod: 600
  visible: false
  color: CurrentColorScheme.value.basic.text.idle
  width: parent.cursorRectangle.width
  SequentialAnimation{
    loops: Animation.Infinite
    running: parent.cursorVisible
    PropertyAction{
      target: _cursor
      property: 'visible'
      value: true
    }
    PauseAnimation{
      duration: _cursor.cursorAnimationPeriod
    }
    PropertyAction{
      target: _cursor
      property: 'visible'
      value: false
    }
    PauseAnimation{
      duration: _cursor.cursorAnimationPeriod
    }
    onStopped: { _cursor.visible = false }
  }
}
