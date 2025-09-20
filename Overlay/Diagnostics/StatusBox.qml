import QtQuick
import "../../Shared"

Item {
    width: 19 * Etc.scale
    height: 19 * Etc.scale
    Rectangle {
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
        width: 17 * Etc.scale
        height: Etc.scale
        color: Etc.foreground
    }
    Rectangle {
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        width: 17 * Etc.scale
        height: Etc.scale
        color: Etc.foreground
    }
    Rectangle {
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        width: Etc.scale
        height: 17 * Etc.scale
        color: Etc.foreground
    }
    Rectangle {
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }
        width: Etc.scale
        height: 17 * Etc.scale
        color: Etc.foreground
    }
}
