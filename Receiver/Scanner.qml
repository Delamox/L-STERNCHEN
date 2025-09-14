import QtQuick
import QtQuick.Controls
import "../Shared"

Item {
    property real playerProgress: {
        const active = Players.active;
        return active?.length ? active.position / active.length : 0;
    }
    width: 1
    height: 1
    Item {
        width: 1
        height: 1
        y: -9 * Etc.scale
        StyledTextVisitor {
            x: -5 * Etc.scale
            color: Etc.foreground
            text: "50"
        }
        StyledTextVisitor {
            x: 15 * Etc.scale
            color: Etc.foreground
            text: "100"
        }
        StyledTextVisitor {
            x: 36 * Etc.scale
            color: Etc.foreground
            text: "150"
        }
        StyledTextVisitor {
            x: 55 * Etc.scale
            color: Etc.foreground
            text: "200"
        }
        StyledTextVisitor {
            x: 77 * Etc.scale
            color: Etc.foreground
            text: "250"
        }
    }
    Timer {
        running: true
        interval: 500
        triggeredOnStart: true
        repeat: true
        onTriggered: Players.active?.positionChanged()
    }
    Slider {
        id: slider
        width: 86 * Etc.scale
        height: 11 * Etc.scale
        value: parent.playerProgress
        onMoved: {
            const active = Players.active;
            if (active?.canSeek && active?.positionSupported)
                active.position = value * active.length;
        }
        handle: Rectangle {
            width: Etc.scale
            height: 11 * Etc.scale
            x: slider.visualPosition * slider.availableWidth
            visible: Players.active
            color: Etc.active
        }
        background: Item {
            anchors.fill: parent
            Arrow {
                rotation: 180
                x: -6 * Etc.scale
                y: Etc.scale
                arrowColor: Etc.accent
                MouseArea {
                    anchors.fill: parent
                    onClicked: Players.active?.previous()
                }
            }
            Arrow {
                x: 88 * Etc.scale
                y: Etc.scale
                arrowColor: Etc.accent
                MouseArea {
                    anchors.fill: parent
                    onClicked: Players.active?.next()
                }
            }
            Rectangle {
                anchors {
                    right: parent.right
                    left: parent.left
                }
                height: Etc.scale
                y: 8 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: Etc.scale
                height: Etc.scale
                y: Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                anchors.bottom: parent.bottom
                width: Etc.scale
                height: Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                anchors {
                    horizontalCenter: parent.horizontalCenter
                    bottom: parent.bottom
                }
                width: Etc.scale
                height: Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                anchors {
                    right: parent.right
                    bottom: parent.bottom
                }
                width: Etc.scale
                height: Etc.scale
                color: Etc.foreground
            }

            Rectangle {
                anchors {
                    top: parent.top
                    left: parent.left
                }
                width: Etc.scale
                height: 8 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                anchors {
                    top: parent.top
                    right: parent.right
                }
                width: Etc.scale
                height: 8 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: Etc.scale
                height: 5 * Etc.scale
                y: 3 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                width: Etc.scale
                height: 4 * Etc.scale
                x: 22 * Etc.scale
                y: height
                color: Etc.foreground
            }
            Rectangle {
                width: Etc.scale
                height: 4 * Etc.scale
                x: 63 * Etc.scale
                y: height
                color: Etc.foreground
            }
            Rectangle {
                width: Etc.scale
                height: 3 * Etc.scale
                x: 10 * Etc.scale
                y: 5 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                width: Etc.scale
                height: 3 * Etc.scale
                x: 32 * Etc.scale
                y: 5 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                width: Etc.scale
                height: 3 * Etc.scale
                x: 53 * Etc.scale
                y: 5 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                width: Etc.scale
                height: 3 * Etc.scale
                x: 74 * Etc.scale
                y: 5 * Etc.scale
                color: Etc.foreground
            }
        }
    }
}
