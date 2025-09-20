import QtQuick
import "../../Shared"

Rectangle {
    property bool activated: false
    property real offset
    required property string label
    width: 33 * Etc.scale
    height: 9 * Etc.scale
    color: (activated) ? Etc.accent : Etc.foreground
    Rectangle {
        width: 31 * Etc.scale
        height: 7 * Etc.scale
        x: Etc.scale
        y: Etc.scale
        color: Etc.background
        StyledTextVisitor {
            id: self
            y: -Etc.scale
            x: parent.width / 2 - self.width / 2 + offset * Etc.scale
            text: label
            color: (activated) ? Etc.accent : Etc.foreground
        }
    }
}
