import QtQuick
import "../../Shared"

Rectangle {
    width: 192 * Etc.scale
    height: 266 * Etc.scale
    color: Etc.accent
    Rectangle {
        id: container
        width: 190 * Etc.scale
        height: 256 * Etc.scale
        x: 1 * Etc.scale
        y: 9 * Etc.scale
        color: Etc.background
        Psychograph {
            width: 121 * Etc.scale
            height: 126 * Etc.scale
            x: 35 * Etc.scale
            y: 31 * Etc.scale
        }
        Status {
            width: 118 * Etc.scale
            height: 80 * Etc.scale
            x: 52 * Etc.scale
            y: 171 * Etc.scale
        }
        Item {
            width: 9 * Etc.scale
            height: 124 * Etc.scale
            x: 7 * Etc.scale
            y: 32 * Etc.scale
            Rectangle {
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                }
                height: Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                width: Etc.scale
                height: 54 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                anchors.right: parent.right
                width: Etc.scale
                height: 54 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                anchors.bottom: parent.bottom
                width: Etc.scale
                height: 54 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                width: Etc.scale
                height: 54 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                }
                height: Etc.scale
                color: Etc.foreground
            }
        }
        Item {
            width: 9 * Etc.scale
            height: 124 * Etc.scale
            x: 175 * Etc.scale
            y: 32 * Etc.scale
            Rectangle {
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                }
                height: Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                width: Etc.scale
                height: 54 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                anchors.right: parent.right
                width: Etc.scale
                height: 54 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                anchors.bottom: parent.bottom
                width: Etc.scale
                height: 54 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                width: Etc.scale
                height: 54 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                }
                height: Etc.scale
                color: Etc.foreground
            }
        }
        Rectangle {
            width: 121 * Etc.scale
            height: 10 * Etc.scale
            x: 35 * Etc.scale
            y: 19 * Etc.scale
            color: Etc.accent
            StyledTextVisitor {
                anchors.centerIn: parent
                text: "hypersensitive"
            }
        }
        Rectangle {
            width: Etc.scale
            height: 124 * Etc.scale
            x: 20 * Etc.scale
            y: 32 * Etc.scale
            color: Etc.accent
        }
        Rectangle {
            width: 10 * Etc.scale
            height: 124 * Etc.scale
            x: 23 * Etc.scale
            y: 32 * Etc.scale
            color: Etc.accent
            StyledTextVisitor {
                anchors.centerIn: parent
                text: "overclustered"
                rotation: 90
            }
        }
        Rectangle {
            width: 10 * Etc.scale
            height: 124 * Etc.scale
            x: 158 * Etc.scale
            y: 32 * Etc.scale
            color: Etc.accent
            StyledTextVisitor {
                anchors.centerIn: parent
                text: "fragmented"
                rotation: 270
            }
        }
        Rectangle {
            width: Etc.scale
            height: 124 * Etc.scale
            x: 170 * Etc.scale
            y: 32 * Etc.scale
            color: Etc.accent
        }
        Rectangle {
            width: 121 * Etc.scale
            height: 10 * Etc.scale
            x: 35 * Etc.scale
            y: 159 * Etc.scale
            color: Etc.accent
            StyledTextVisitor {
                anchors.centerIn: parent
                text: "catatonic"
            }
        }
        Item {
            width: 39 * Etc.scale
            height: 79 * Etc.scale
            x: 7 * Etc.scale
            y: 171 * Etc.scale
            StatusBox {
                anchors {
                    top: parent.top
                    right: parent.right
                }
            }
            StatusBox {
                anchors {
                    top: parent.top
                    left: parent.left
                }
            }
            StatusBox {
                anchors.left: parent.left
                y: 20 * Etc.scale
            }
            StatusBox {
                anchors.right: parent.right
                y: 20 * Etc.scale
            }
            StatusBox {
                anchors.left: parent.left
                y: 40 * Etc.scale
            }
            StatusBox {
                anchors.right: parent.right
                y: 40 * Etc.scale
            }
            StatusBox {
                anchors {
                    bottom: parent.bottom
                    right: parent.right
                }
            }
            StatusBox {
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                }
            }
        }
        Rectangle {
            width: 90 * Etc.scale
            height: 11 * Etc.scale
            x: 50 * Etc.scale
            y: 5 * Etc.scale
            color: Etc.active
            StyledTextVisitor {
                anchors.centerIn: parent
                text: "diagnostics"
                color: Etc.background
            }
        }
    }
}
