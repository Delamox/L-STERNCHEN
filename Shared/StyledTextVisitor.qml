import QtQuick

Text {
    property int pixelHeight: 5
    font.family: visitor2.font.family
    font.pointSize: 13 * Etc.scale / 7 * pixelHeight
    // antialiasing: false
    // renderType: Text.NativeRendering
}
