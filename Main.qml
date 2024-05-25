import QtQuick
import "const"
import "qml"

Window {
    width: Constants.stdWidth
    height: Constants.stdHeight
    visible: true
    title: qsTr("Hello World")

    GButton{
        colors: DefaultColorScheme
    }

    Component.onCompleted: {
        //console.log(DefaultColorScheme)
    }
}
