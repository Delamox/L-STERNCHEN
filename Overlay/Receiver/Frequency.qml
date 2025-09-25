import QtQuick
import Quickshell.Services.Pipewire
import "../../Shared"

Item {
    property PwNode sink: Pipewire.defaultAudioSink
    property var volume: sink.audio.volume
    PwObjectTracker {
        objects: [ borders.sink ]
    }
    id: borders
    width: 94 * Etc.scale
    height: 38 * Etc.scale
    // MouseArea {
    //     anchors.fill: parent
    //     onWheel: event => {
    //         console.log(event.angleDelta)
    //         if (event.angleDelta.y < 0) {
    //             borders.sink.audio.volume += 0.0025;
    //         } else if (event.angleDelta.y > 0) {
    //             borders.sink.audio.volume += -0.0025;

    //         }
    //     }
    // }
    StyledTextVisitor {
        x: 96 * Etc.scale
        y: 32 * Etc.scale - 0.8 * Etc.scale
        text: "per"
        color: Etc.foreground
    }
    StyledTextVisitor {
        x: -17 * Etc.scale
        y: 32 * Etc.scale - 0.8 * Etc.scale
        text: "vol"
        color: Etc.foreground
    }
    StyledTextEngschrift {
        anchors.centerIn: parent
        text: qsTr("%1.000").arg(Math.round(volume * 100))
        color: (Players.active) ? Etc.accent : Etc.foreground
        fontSizeMode: Text.Fit
        pixelHeight: 15
    }
    Rectangle {
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }
        width: Etc.scale
        height: 38 * Etc.scale
        color: Etc.foreground
    }
    Rectangle {
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
        }
        width: Etc.scale
        height: 38 * Etc.scale
        color: Etc.foreground
    }
    Rectangle {
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }
        width: 76 * Etc.scale
        height: Etc.scale
        color: Etc.foreground
    }
    Rectangle {
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
        }
        width: 76 * Etc.scale
        height: Etc.scale
        color: Etc.foreground
    }
    Rectangle {
        anchors {
            top: parent.top
            left: parent.left
        }
        width: 8 * Etc.scale
        height: Etc.scale
        color: Etc.foreground
    }
    Rectangle {
        anchors {
            bottom: parent.bottom
            left: parent.left
        }
        width: 8 * Etc.scale
        height: Etc.scale
        color: Etc.foreground
    }
    Rectangle {
        anchors {
            top: parent.top
            right: parent.right
        }
        width: 8 * Etc.scale
        height: Etc.scale
        color: Etc.foreground
    }
    Rectangle {
        anchors {
            bottom: parent.bottom
            right: parent.right
        }
        width: 8 * Etc.scale
        height: Etc.scale
        color: Etc.foreground
    }
    Item {
        width: 3 * Etc.scale
        height: 3 * Etc.scale
        x: 95 * Etc.scale
        Pixel {
            anchors {
                left: parent.left
                top: parent.top
            }
            color: Etc.foreground
        }
        Pixel {
            anchors {
                left: parent.left
                bottom: parent.bottom
            }
            color: Etc.foreground
        }
        Pixel {
            anchors {
                right: parent.right
                top: parent.top
            }
            color: Etc.foreground
        }
        Pixel {
            anchors {
                right: parent.right
                bottom: parent.bottom
            }
            color: Etc.foreground
        }
    }
}
