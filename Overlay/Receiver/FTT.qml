import QtQuick
import "../../Shared"

Item {
    width: 86 * Etc.scale
    height: 65 * Etc.scale
    Repeater {
        model: 22
        Rectangle {
            required property var modelData
            width: 2 * Etc.scale
            height: parent.height
            x: 4 * modelData * Etc.scale
            color: Etc.foreground
        }
    }
    Item {
        id: ftt
        width: 11 * Etc.scale
        height: 4 * Etc.scale
        y: 67 * Etc.scale
        Item {
            height: parent.height
            width: 3 * Etc.scale
            Rectangle {
                width: 3 * Etc.scale
                height: Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                width: Etc.scale
                height: 4 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                width: 2 * Etc.scale
                height: Etc.scale
                y: 2 * Etc.scale
                color: Etc.foreground
            }
        }
        Item {
            height: parent.height
            width: 3 * Etc.scale
            x: 4 * Etc.scale
            Rectangle {
                width: 3 * Etc.scale
                height: Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                width: Etc.scale
                height: 4 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                width: 2 * Etc.scale
                height: Etc.scale
                y: 2 * Etc.scale
                color: Etc.foreground
            }
        }
        Item {
            height: parent.height
            width: 3 * Etc.scale
            x: 8 * Etc.scale
            Rectangle {
                width: 3 * Etc.scale
                height: Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                width: Etc.scale
                height: 4 * Etc.scale
                x: Etc.scale
                color: Etc.foreground
            }
        }
    }

    Item {
        id: sidebox
        width: 11 * Etc.scale
        height: 4 * Etc.scale
        x: 75 * Etc.scale
        y: 67 * Etc.scale
        Rectangle {
            anchors {
                top: parent.top
                left: parent.left
            }
            width: 11 * Etc.scale
            height: 2 * Etc.scale
            color: Etc.foreground
        }
        Rectangle {
            anchors {
                top: parent.top
                left: parent.left
            }
            width: 10 * Etc.scale
            height: 3 * Etc.scale
            color: Etc.foreground
        }
        Rectangle {
            anchors {
                top: parent.top
                left: parent.left
            }
            width: 9 * Etc.scale
            height: 4 * Etc.scale
            color: Etc.foreground
        }
    }
    Item {
        id: buttons
        width: 1
        height: 1
        Arrow {
            rotation: 90
            x: 10.5 * Etc.scale
            y: 78.5 * Etc.scale
            arrowColor: Etc.foreground
        }
        Arrow {
            rotation: 270
            x: 22.5 * Etc.scale
            y: 78.5 * Etc.scale
            arrowColor: Etc.foreground
        }
        Item {
            width: 7 * Etc.scale
            height: 8 * Etc.scale
            x: 34.5 * Etc.scale
            y: 76.5 * Etc.scale
            MouseArea {
                anchors.fill: parent
                onClicked: Players.active?.seek(-10)
                focusPolicy: Qt.NoFocus;
            }
            Arrow {
                rotation: 90
                arrowColor: Etc.foreground
            }
            Arrow {
                rotation: 90
                y: 4 * Etc.scale
                arrowColor: Etc.foreground
            }
        }
        Item {
            width: 7 * Etc.scale
            height: 8 * Etc.scale
            x: 46.5 * Etc.scale
            y: 76.5 * Etc.scale
            MouseArea {
                anchors.fill: parent
                onClicked: Players.active?.seek(10)
                focusPolicy: Qt.NoFocus;
            }
            Arrow {
                rotation: 270
                arrowColor: Etc.foreground
            }
            Arrow {
                rotation: 270
                y: 4 * Etc.scale
                arrowColor: Etc.foreground
            }
        }
        Item {
            width: 5 * Etc.scale
            height: 6 * Etc.scale
            x: 58 * Etc.scale
            y: 79 * Etc.scale
            MouseArea {
                anchors.fill: parent
                onClicked: Players.active?.playPause()
                focusPolicy: Qt.NoFocus;
            }
            Rectangle {
                anchors {
                    top: parent.top
                    left: parent.left
                }
                height: parent.height
                width: 2 * Etc.scale
                color: Etc.foreground
            }
            Rectangle {
                anchors {
                    top: parent.top
                    right: parent.right
                }
                height: parent.height
                width: 2 * Etc.scale
                color: Etc.foreground
            }
        }
        Rectangle {
            width: 6 * Etc.scale
            height: 6 * Etc.scale
            x: 70 * Etc.scale
            y: 79 * Etc.scale
            color: Etc.foreground
            MouseArea {
                anchors.fill: parent
                onClicked: Players.active?.stop()
                focusPolicy: Qt.NoFocus;
            }
        }
    }
    Connections {
        target: Cava
        function onValuesChanged(): void {
            visualiser.requestPaint();
        }
    }
    Canvas {
        id: visualiser
        width: 22 * Etc.scale * 4
        height: 65 * Etc.scale
        Rectangle {
            anchors.fill: parent
            color: "transparent"
        }
        onPaint: {
            const ctx = getContext("2d");
            ctx.reset();

            const values = Cava.values;
            const len = values.length;

            ctx.strokeStyle = Etc.active;
            ctx.lineWidth = 2 * Etc.scale;
            for (let i = 0; i < len; i++) {
                ctx.moveTo(Etc.scale + i * Etc.scale * 4, 65 * Etc.scale );
                ctx.lineTo(Etc.scale + i * Etc.scale * 4, 63 * Etc.scale - (values[i]) / 100 * 63 * Etc.scale);
            }
            ctx.stroke();
        }
    }
}
