# Graduation project client
## Brief info
This is a Qt6 project built with QtCreator 13.0.0 (Community). It represents a desktop application client. Interface was developed using QtQuick 2.
## Custom types and components
## Basic color types
- [GColorTriplet](#gcolortriplet-type)
- GColorSet
- GColorScheme

###GColorTriplet type
Contains one color for each control state: 
- idle
- hover
- active (i.e. currently has a keyboard focus)

###GColorSet
Contains a set of two `GColorTriplet` instances. One is for control background colors and another is for its text colors.

###GColorScheme
Complex type containing all colors used by color scheme. Includes:
- basic: default colors used by plain text
- control: buttons and menu
- input: string user input fields
- danger: buttons like `Exit`, `Delete ...`
- stroke: borders
- ref: links and references
- canvas: application window background
- placeholder: placeholders in user input fields