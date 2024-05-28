import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import '../types'
import '../config'
import '../strings'


GPage{
  id: _root
  groupIndex: Controls.menuProfile
  index: 0
  property int preferredLabelWidth
  property int preferredInputWidth


  GridLayout{
    id: _userInfoLayout
    anchors{
      right: _root.right; rightMargin: 40
      left: _root.left; leftMargin: 30
      top: _root.top; topMargin: 30

    }

    height: parent.height / Controls.profileInfoLayoutHeightRatio

    rows: 4; columns: 2
    rowSpacing: 20; columnSpacing: 80

    GLabel{
      id: _lastNameLabel
      text: Russian.labels.lastName;
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: _root.preferredInputWidth
      Layout.maximumWidth: _root.preferredInputWidth
    }
    GTextField{
      id: _lastNameInput
      //text: Russian.labels.lastName;
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: _root.preferredInputWidth
      Layout.maximumWidth: _root.preferredInputWidth
    }

    GLabel{
      id: _firstNameLabel
      text: Russian.labels.firstName;
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: _root.preferredInputWidth
      Layout.maximumWidth: _root.preferredInputWidth
    }
    GTextField{
      id: _firstNameInput
      //text: Russian.labels.firstName;
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: _root.preferredInputWidth
      Layout.maximumWidth: _root.preferredInputWidth
    }

    GLabel{
      id: _middleNameLabel
      text: Russian.labels.middleName;
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: _root.preferredInputWidth
      Layout.maximumWidth: _root.preferredInputWidth
    }
    GTextField{
      id: _middleNameInput
      //text: Russian.labels.middleName;
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: _root.preferredInputWidth
      Layout.maximumWidth: _root.preferredInputWidth
    }

    GLabel{
      id: _emailLabel
      text: Russian.labels.email;
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: _root.preferredInputWidth
      Layout.maximumWidth: _root.preferredInputWidth
    }
    GTextField{
      id: _emailInput
      //text: Russian.labels.email;
      Layout.fillWidth: true
      Layout.fillHeight: true
      Layout.preferredWidth: _root.preferredInputWidth
      Layout.maximumWidth: _root.preferredInputWidth
    }
  }

  function calcPreferredWidth(){
    let res = WindowSizes.stdWidth / Controls.basicInputWidthRatio
    console.log(res)
    return res
  }

  Component.onCompleted: {
    _root.preferredInputWidth = _root.calcPreferredWidth()
    console.log(_emailLabel.width)
  }
}
