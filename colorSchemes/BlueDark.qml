pragma Singleton

import "../types/basic"

GColorScheme{
  basic: GColorSet{
    id: _basic
    background: GColorTriplet{
      idle: "#163E5A"
      hover: _basic.background.idle
      active: _basic.background.idle
    }
    text: GColorTriplet{
      idle: "#FFF"
      hover: _basic.text.idle
      active: _basic.text.idle
    }
  }

  control: GColorSet{
    id: _control
    background: GColorTriplet{
      idle: "#1A4666"
      hover: "#24628F"
      active: "#2970A3"
    }
    text: GColorTriplet{
      idle: _basic.text.idle
      hover: "#EBF4FA"
      active: _basic.text.idle
    }
  }

  input: GColorSet{
    id: _input
    background: GColorTriplet{
      idle: "#1D4F72"
      hover: _input.background.idle
      active: "#24628F"
    }
    text: _basic.text
  }

  danger: GColorSet{
    id: _danger
    background: GColorTriplet{
      idle: "#521914"
      hover: "#7A261F"
      active: "#A33329"
    }
    text: GColorTriplet{
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
