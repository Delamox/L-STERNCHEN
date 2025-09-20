import QtQuick
import "../../Shared"

Item {
    property color bookColor: "white"
    property bool vis: true
    property string label
    width: 192 * Etc.scale
    height: 16 * Etc.scale
    Rectangle {
        width: 190 * Etc.scale
        height: 14 * Etc.scale
        color: bookColor
        visible: vis
    }
    Rectangle {
        width: 190 * Etc.scale
        height: 14 * Etc.scale
        x: Etc.scale
        y: Etc.scale
        color: bookColor
        visible: vis
    }
    Rectangle {
        width: 190 * Etc.scale
        height: 14 * Etc.scale
        x: 2 * Etc.scale
        y: 2 * Etc.scale
        color: bookColor
        visible: vis
    }
    StyledTextSilver {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 0.5 * Etc.scale
        text: label
        color: "black"
        pixelHeight: 8
    }
}
