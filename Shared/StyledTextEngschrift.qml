import QtQuick

Text {
    property int pixelHeight: 5
    font.family: engschrift.font.family
    font.pointSize: 13 * Etc.scale / 7 * pixelHeight
    // antialiasing: false
    // renderType: Text.NativeRendering
}
