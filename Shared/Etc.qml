pragma Singleton
import QtQuick

Item {
    property real scale: 3// size of a pixel, should be floored monitor height / 600
    property int transitionSpeed: 100
    property int visualiserFramerate: 60
    property int visualiserSmoothing: 15
    // property int visualiserLowCut: 50
    // property int visualiserHighCut: 10000
    property color active: "#FFFFFF"
    property color accent: "#CC3500"
    // property color accent: "#8561b2"
    // property color accent: "#00cc35"
    // property color accent: "#3500cc"
    // property color accent: "#ff0088"
    // property color accent: "#0088ff"
    property color background: "#131313"
    property color foreground: "#3F3F3F"
    property color highground: "#979797"
    property color lowground: "#242424"
}
