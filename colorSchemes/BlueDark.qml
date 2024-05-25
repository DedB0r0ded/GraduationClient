pragma Singleton

import "../types/basic"

GColorScheme{
  basic: GColorSet{
    id: _basic
    background: GColorTriplet {
      idle: "#163E5A"
      hover: _basic.background.idle
      active: _basic.background.idle
    }
    text: GColorTriplet {
      idle: "#FFF"
      hover: _basic.text.idle
      active: _basic.text.idle
    }
  }

  input: GColorSet{
    id: _input
    background: GColorTriplet {
      idle: "#1D4F72"
      hover: _input.background.idle
      active: "#24628F"
    }
    text: _basic.text
  }

  danger: GColorSet{
    id: _danger
    background: GColorTriplet {
      idle: "#521914"
      hover: "#A33329"
      active: "#7A261F"
    }
    text: GColorTriplet {
      idle: "#FBECEA"
      hover: "#D23A2D"
      active: "#FEF6F6"
    }
  }

  stroke: GColorTriplet{
    id: _stroke
    idle: "#FFF"
    hover: "#EBF4FA"
    active: _stroke.idle
  }

  ref: GColorTriplet{
    id: _ref
    idle: "#FFF"
    hover: "#ADD1EB"
    active: "#D6E8F5"
  }

  canvas: "#143852"

  placeholder: "#FFF"
}
