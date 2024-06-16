import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import ".."
import "../strings"
import "../types"
import "../types/basic"
import "../config"
import "../colorSchemes"
import "../js"
import "../pages"

GDialog{
  property int i: 0
  property bool edited: false
  id: root
  sectionTitle: "Отзывы"
  width: 800
  height: 600

  GLabel{
    text: "Отзывы"
    x: 250
    y: 20
    width: 300
    height: 100
  }

  GIconButton{
    x: 10
    y: 260
    width: 80
    height: 80
    darkIconSource: "qrc:///images/backArrowDark.png"
    lightIconSource: "qrc:///images/backArrowLight.png"
    onClicked: {
      if(root.i > 0)
        root.i--
    }
  }

  GIconButton{
    x: 700
    y: 260
    width: 80
    height: 80
    darkIconSource: "qrc:///images/nextArrowDark.png"
    lightIconSource: "qrc:///images/nextArrowLight.png"
    onClicked: {
      if(Fix.reviews.length > root.i + 1)
        root.i++
    }
  }

  GLabel{
    x: 120; y: 170
    height: 60; width: 200
    text: "Компания:"
    font.pointSize: FontProperties.plainTextSize
  }
  GLabel{
    x: 120; y: 250
    height: 60; width: 200
    text: "Качество работ:"
    font.pointSize: FontProperties.plainTextSize
  }
  GLabel{
    x: 120; y: 330
    height: 60; width: 200
    text: "Детали:"
    font.pointSize: FontProperties.plainTextSize
  }
  GTextField{
    id: o
    x: 350; y: 170
    height: 60; width: 300
    //enabled: root.edited
    text: root.edited ? "" : Fix.reviews[root.i]["org"]
    font.pointSize: FontProperties.plainTextSize
  }
  GTextField{
    id: q
    x: 350; y: 250
    height: 60; width: 300
    //enabled: root.edited
    text: root.edited ? "" : Fix.reviews[root.i]["quality"]
    font.pointSize: FontProperties.plainTextSize
  }
  GTextField{
    id: d
    x: 350; y: 330
    height: 60; width: 300
    maximumLength: 240

    //enabled: root.edited
    text: root.edited ? "" : Fix.reviews[root.i]["details"]
    font.pointSize: FontProperties.plainTextSize
  }

  GButton{
    x: 250; y: 520
    height: 60; width: 300
    text: root.edited ? "Сохранить" : "Написать отзыв"
    font.pointSize: FontProperties.plainTextSize
    onClicked: {
      if(root.edited){
        Fix.reviews.push({"org": o.text, "quality": q.text, "details": d.text})
        root.edited = false
        root.i = 0
      }
      else{
        root.edited = true
        root.i = Fix.reviews.length
      }
    }
  }
}
