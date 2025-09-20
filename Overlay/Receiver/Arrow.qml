import QtQuick
import "../../Shared"

Item {
    required property color arrowColor
    width: 4 * Etc.scale
    height: 7 * Etc.scale
    Rectangle {
        width: Etc.scale
        height: 7 * Etc.scale
        color: arrowColor
    }
    Rectangle {
        width: Etc.scale
        height: 5 * Etc.scale
        x: Etc.scale
        y: Etc.scale
        color: arrowColor
    }
    Rectangle {
        width: Etc.scale
        height: 3 * Etc.scale
        x: 2 * Etc.scale
        y: 2 * Etc.scale
        color: arrowColor
    }
    Rectangle {
        width: Etc.scale
        height: Etc.scale
        x: 3 * Etc.scale
        y: 3 * Etc.scale
        color: arrowColor
    }
}
