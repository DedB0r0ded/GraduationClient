import QtQuick
import QtQuick.Controls

Item{
    id: _root

    property GColorGroup colors

    Button{
        id: _button
        background: Rectangle{
            id: _bg
            color: _button.hovered && !_button.down ? _root.colors.hover
                    : _button.down ? _root.colors.active
                    : _root.colors.idle
        }
        contentItem: Text{
            id: _text
            color: colors.textIdle
        }
    }

    QtObject{
        id: functions
    }
}
