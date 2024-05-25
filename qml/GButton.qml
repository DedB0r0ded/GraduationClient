import QtQuick
import QtQuick.Controls

Item{
    id: _root

    property GColorGroup colors

    Button{
        id: _button
        background: Rectangle{
            id: _bg
            color: _funs.bgcolor()
        }
        contentItem: Text{
            id: _text
            color: colors.textIdle
        }
    }

    QtObject{
        id: _funs

        function bgcolor(){
            if(_button.hovered && !_button.down)
                return _root.colors.hover
            else if(_button.down)
                return _root.colors.active
            else
                return _root.colors.idle
        }
    }
}
