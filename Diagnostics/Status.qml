import QtQuick
import Quickshell.Services.UPower
import "../Shared"

Item {
    property real battery: UPower.displayDevice.percentage
    function average(a,b,c,p,q,r) {
        console.log((a*p+b*q+c*r))
        return ((a*p+b*q+c*r)/255)
    }
    Item {
        width: 3 * Etc.scale
        height: 3 * Etc.scale
        x: 97 * Etc.scale
        y: 6 * Etc.scale
        Pixel {
            color: Etc.foreground
        }
        Pixel {
            x: 2 * Etc.scale
            color: Etc.foreground
        }
        Pixel {
            x: 1 * Etc.scale
            y: 1 * Etc.scale
            color: Etc.foreground
        }
        Pixel {
            y: 2 * Etc.scale
            color: Etc.foreground
        }
        Pixel{
            x: 2 * Etc.scale
            y: 2 * Etc.scale
            color: Etc.foreground
        }
    }
    Rectangle {
        width: 15 * Etc.scale
        height: 15 * Etc.scale
        x: 103 * Etc.scale
        y: 10 * Etc.scale
            color: Etc.active
        Rectangle {
            anchors.centerIn: parent
            width: 13 * Etc.scale
            height: 13 * Etc.scale
            color: Etc.background
            Repeater {
                model: 13
                Pixel {
                    required property var modelData
                    x: modelData * Etc.scale
                    y: modelData * Etc.scale
                    color: Etc.active
                }
            }
        }
    }
    Item {
        width: 96 * Etc.scale
        height: 36 * Etc.scale
        y: 5 * Etc.scale
        Item {
            property color healthColor: Qt.rgba( // needs proper gradient
                255,
                average(255, 0, 0, battery, 1.0 - battery, 0.0),
                average(0, 255, 0, battery, 1.0 - battery, 0.0),
                average(255, 255, 255, battery, 1.0 - battery, 0.0)
            )
            anchors.centerIn: parent
            width: 92 * Etc.scale
            height: 32 * Etc.scale
            Rectangle {
                width: 89 * Etc.scale
                height: 29 * Etc.scale
                x: 3 * Etc.scale
                color: parent.healthColor
            }
            Rectangle {
                width: 89 * Etc.scale
                height: 29 * Etc.scale
                x: 2 * Etc.scale
                y: 1 * Etc.scale
                color: parent.healthColor
            }
            Rectangle {
                width: 89 * Etc.scale
                height: 29 * Etc.scale
                x: 1 * Etc.scale
                y: 2 * Etc.scale
                color: parent.healthColor
            }
            Rectangle {
                width: 89 * Etc.scale
                height: 29 * Etc.scale
                y: 3 * Etc.scale
                color: parent.healthColor
            }
            Item {
                width: 9 * Etc.scale
                height: 9 * Etc.scale
                x: 2 * Etc.scale
                y: 20 * Etc.scale
                Rectangle {
                    anchors.verticalCenter: parent.verticalCenter
                    width: 9 * Etc.scale
                    height: 3 * Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: 3 * Etc.scale
                    height: 9 * Etc.scale
                    color: Etc.background
                }
            }
            StyledTextSilver {
                width: parent.width - Etc.scale
                text: "WARNING"
                pixelHeight: 6
                horizontalAlignment: Text.AlignRight
            }
            Item {
                width: 11 * Etc.scale
                height: 11 * Etc.scale
                x: 13 * Etc.scale
                y: 19 * Etc.scale
                Rectangle {
                    y: Etc.scale
                    width: 5 * Etc.scale
                    height: Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    y: 4 * Etc.scale
                    width: 5 * Etc.scale
                    height: Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    x: 1 * Etc.scale
                    width: Etc.scale
                    height: 5 * Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    x: 3 * Etc.scale
                    width: Etc.scale
                    height: 5 * Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    width: 5 * Etc.scale
                    height: Etc.scale
                    y: 6 * Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    width: 5 * Etc.scale
                    height: Etc.scale
                    y: 8 * Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    width: 5 * Etc.scale
                    height: Etc.scale
                    y: 10 * Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    height: 5 * Etc.scale
                    width: Etc.scale
                    y: 6 * Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    height: 5 * Etc.scale
                    width: Etc.scale
                    x: 4 * Etc.scale
                    y: 6 * Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    height: 2 * Etc.scale
                    width: Etc.scale
                    x: 7 * Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    height: Etc.scale
                    width: 4 * Etc.scale
                    x: 6 * Etc.scale
                    y: Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    height: Etc.scale
                    width: 4 * Etc.scale
                    x: 6 * Etc.scale
                    y: 3 * Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    height: Etc.scale
                    width: 5 * Etc.scale
                    x: 6 * Etc.scale
                    y: 5 * Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    height: Etc.scale
                    width: 5 * Etc.scale
                    x: 6 * Etc.scale
                    y: 7 * Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    height: 7 * Etc.scale
                    width: Etc.scale
                    x: 6 * Etc.scale
                    y: Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    height: 5 * Etc.scale
                    width: Etc.scale
                    x: 9 * Etc.scale
                    y: Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    height: 4 * Etc.scale
                    width: Etc.scale
                    x: 10 * Etc.scale
                    y: 7 * Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    height: 2 * Etc.scale
                    width: Etc.scale
                    x: 6 * Etc.scale
                    y: 9 * Etc.scale
                    color: Etc.background
                }
                Pixel {
                    x: 8 * Etc.scale
                    y: 9 * Etc.scale
                    color: Etc.background
                }
                Rectangle {
                    width: 2 * Etc.scale
                    height: Etc.scale
                    x: 9 * Etc.scale
                    y: 10 * Etc.scale
                    color: Etc.background
                }
            }
        }
        Rectangle {
            anchors.right: parent.right
            width: 92 * Etc.scale
            height: Etc.scale
            color: Etc.active
        }
        Pixel {
            x: 3 * Etc.scale
            y: Etc.scale
            color: Etc.active
        }
        Pixel {
            x: 2 * Etc.scale
            y: 2 * Etc.scale
            color: Etc.active
        }
        Pixel {
            x: 1 * Etc.scale
            y: 3 * Etc.scale
            color: Etc.active
        }
        Rectangle {
            width: Etc.scale
            height: 32 * Etc.scale
            y: 4 * Etc.scale
            color: Etc.active
        }
        Rectangle {
            anchors.right: parent.right
            width: Etc.scale
            height: 32 * Etc.scale
            color: Etc.active
        }
        Pixel {
            x: 94 * Etc.scale
            y: 32 * Etc.scale
            color: Etc.active
        }
        Pixel {
            x: 93 * Etc.scale
            y: 33 * Etc.scale
            color: Etc.active
        }
        Pixel {
            x: 92 * Etc.scale
            y: 34 * Etc.scale
            color: Etc.active
        }
        Rectangle {
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            width: 92 * Etc.scale
            height: Etc.scale
            color: Etc.active
        }
    }
}
