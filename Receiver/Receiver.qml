import QtQuick
import "../Shared"

Rectangle {
    id: root
    width: 150 * Etc.scale
    height: 266 * Etc.scale
    color: (root.focus ? Etc.active : Etc.accent)
    MouseArea {
        anchors.fill: parent
        onClicked: root.focus = true
    }
    Rectangle {
        id: container
        width: 148 * Etc.scale
        height: 256 * Etc.scale
        x: 1 * Etc.scale
        y: 9 * Etc.scale
        color: Etc.background
        Scanner {
            x: 50 * Etc.scale
            y: 73 * Etc.scale
        }
        Boxes {
            x: 4 * Etc.scale
            y: 68 * Etc.scale
        }
        Transkript {
            x: 4 * Etc.scale
            y: 179 * Etc.scale
        }
        Frequency {
            x: 28 * Etc.scale
            y: 23 * Etc.scale
        }
        FTT {
            x: 50 * Etc.scale
            y: 86 * Etc.scale
        }
        Rectangle {
            width: 90 * Etc.scale
            height: 11 * Etc.scale
            x: 30 * Etc.scale
            y: 5 * Etc.scale
            color: Etc.active
            StyledTextVisitor {
                anchors.centerIn: parent
                text: "receiver"
                color: Etc.background
            }
        }
    }
}
