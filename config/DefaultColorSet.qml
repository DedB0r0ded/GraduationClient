pragma Singleton

import QtQuick
import "../types/basic"

GColorSet{
  background: GColorTriplet{
    idle: "#88F"
    hover: "#55A"
    active: "#448"
  }

  text: GColorTriplet{
    idle: "black"
    hover: "black"
    active: "black"
  }
}
