pragma Singleton

import "../types/basic"

GColorScheme{
  basic: GColorSet{
    id: _basic
    background: GColorTriplet {
      idle: "#F9FAFA"
      hover: _basic.background.idle
      active: _basic.background.idle
    }
    text: GColorTriplet {
      idle: "#033B63"
      hover: _basic.text.idle
      active: _basic.text.idle
    }
  }

  input: GColorSet{
    id: _input
    background: GColorTriplet {
      idle: "#DBE7F0"
      hover: _input.background.idle
      active: "#F5FBFF"
    }
    text: _basic.text
  }

  danger: GColorSet{
    id: _danger
    background: GColorTriplet {
      idle: "#FEE6E6"
      hover: "#FC8383"
      active: "#FDB4B4"
    }
    text: GColorTriplet {
      idle: "#300303"
      hover: "#F90606"
      active: "#610505"
    }
  }

  stroke: GColorTriplet{
    id: _stroke
    idle: "#033B63"
    hover: "#045995"
    active: _stroke.idle
  }

  ref: GColorTriplet{
    id: _ref
    idle: "#0095FF"
    hover: "#005999"
    active: "#033B63"
  }

  canvas: "#FFF"

  placeholder: "#FFF"
}
