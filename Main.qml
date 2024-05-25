import QtQuick
import GQml

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
