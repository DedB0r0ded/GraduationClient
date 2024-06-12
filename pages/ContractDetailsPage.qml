import QtQuick
import QtQuick.Layouts
import QtQuick.Controls



import ".."
import "../strings"
import "../types/basic"
import "../types"
import "../dialogs"
import "../config"
import "../colorSchemes"
import "../js"
import "../pages"

GPage{
  id: _root
  groupIndex: Controls.menuContracts
  index: Controls.contractDetailsPage

  signal pageCalled(int index)

  Row{
    id: row1
    spacing: 40
    anchors{
      top: parent.top; topMargin: 20
      left: parent.left; leftMargin: 20
      right: parent.right; rightMargin: 20
    }

    GGroupBox{
      id: _customerBox
      width: _root.width / 36 * 17
      height: _root.height / 27 * 10
      GLabel{
        id: csl
        width: parent.width / 7
        height: parent.height / 17 * 6
        anchors{
          left: parent.left
          top: parent.top
          topMargin: 10
        }
        text: "Заказчик"
      }
      GTextField{
        id: csni
        anchors{
          horizontalCenter: parent.horizontalCenter
          top: csl.bottom
          topMargin: 10
        }

        width: parent.width / 1.1; height: parent.height / 5
        placeholderText: "Наименование"
      }
      GTextField{
        id: csai
        anchors{
          horizontalCenter: parent.horizontalCenter
          top: csni.bottom
          topMargin: 10
        }
        width: parent.width / 1.1; height: parent.height / 5
        placeholderText: "Юридический адрес"
      }
      GTextField{
        id: csii
        anchors{
          horizontalCenter: parent.horizontalCenter
          top: csai.bottom
          topMargin: 10
        }
        width: parent.width / 1.1; height: parent.height / 5
        placeholderText: "ИНН/УНП"
      }
    }
    GGroupBox{
      id: _contractorBox
      width: _root.width / 36 * 17
      height: _root.height / 27 * 10
      GLabel{
        id: cnl
        width: parent.width / 7
        height: parent.height / 17 * 6
        anchors{
          left: parent.left
          top: parent.top
          topMargin: 10
        }
        text: "Исполнитель"
      }
      GTextField{
        id: cnni
        anchors{
          horizontalCenter: parent.horizontalCenter
          top: cnl.bottom
          topMargin: 10
        }
        width: parent.width / 1.1; height: parent.height / 5
        placeholderText: "Наименование"
      }
      GTextField{
        id: cnai
        anchors{
          horizontalCenter: parent.horizontalCenter
          top: cnni.bottom
          topMargin: 10
        }
        width: parent.width / 1.1; height: parent.height / 5
        placeholderText: "Юридический адрес"
      }
      GTextField{
        id: cnii
        anchors{
          horizontalCenter: parent.horizontalCenter
          top: cnai.bottom
          topMargin: 10
        }
        width: parent.width / 1.1; height: parent.height / 5
        placeholderText: "ИНН/УНП"
      }
    }
  }

  Row{
    id: row2
    spacing: 60
    anchors{
      top: row1.bottom
      topMargin: 40
      left: parent.left; leftMargin: 20
      right: parent.right; rightMargin: 20
    }

    GLabel{
      width: 600
      height: 80
      text: "Разовый договор"
    }
    CheckBox{
      id: c1
      width: 120
      height: 80
    }
  }

  Row{
    id: row3
    spacing: 60
    anchors{
      top: row2.bottom
      topMargin: 40
      left: parent.left; leftMargin: 20
      right: parent.right; rightMargin: 20
    }
    GLabel{
      width: 600
      height: 80
      text: "Предмет договора"
    }
    GTextField{
      width: 600
      height: 80
    }
  }

  Row{
    id: row4
    spacing: 60
    anchors{
      top: row3.bottom
      topMargin: 40
      left: parent.left; leftMargin: 20
      right: parent.right; rightMargin: 20
    }
    GLabel{
      width: 600
      height: 80
      text: "Дата подписания"
    }
    GTextField{
      width: 600
      height: 80
    }
  }

  Row{
    id: row5
    spacing: 60
    anchors{
      top: row4.bottom
      topMargin: 40
      left: parent.left; leftMargin: 20
      right: parent.right; rightMargin: 20
    }
    GLabel{
      width: 600
      height: 80
      text: c1.checked ? "Сумма по договору" : "Дата истечения"
    }
    GLabel{
      width: 600
      height: 80
      text: c1.checked ? "0" : Fix.contract1.expiresOn
    }
  }

  Row{
    id: row6
    spacing: 20
    anchors{
      top: row5.bottom
      topMargin: 40
      bottom: parent.bottom
      left: parent.left; leftMargin: 20
      right: parent.right; rightMargin: 20
    }
    XGButton{
      width: 400
      height: 80
      atext: "Сохранить изменения"
    }
    XGButton{
      width: 400
      height: 80
      atext: c1.checked ? "К списку услуг" : "К списку объектов"
      onClicked: mouse => _root.nav(mouse)
    }
    XGButton{
      width: 400
      height: 80
      dangerous: true
      atext: "Удалить запись"
    }
  }

  function formatDate(date) {
          // Get the day, month, and year
          let day = date.getDate();
          let month = date.getMonth() + 1; // Months are zero-based
          let year = date.getFullYear();

          // Add leading zeros if necessary
          day = day < 10 ? '0' + day : day;
          month = month < 10 ? '0' + month : month;

          // Format the date string as "DD-MM-YYYY"
          return day + '-' + month + '-' + year;
      }

  function nav(m){
    if(c1.checked)
      _root.pageCalled(Controls.contractServiceListPage)
    else
      _root.pageCalled(Controls.contractMaintenanceListPage)
  }
}
