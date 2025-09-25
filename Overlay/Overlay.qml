import QtQuick
import Quickshell
import Quickshell.Hyprland
import "./Receiver"
import "./Memory"
import "./Diagnostics"
import "../Shared"

PanelWindow {
    id: root
    visible: false
    color: "transparent"
    exclusionMode: ExclusionMode.Ignore
    focusable: true
    GlobalShortcut {
        name: "visibility"
        appid: "quickshell"
        onPressed: toggleVis()
    }
    function toggleVis() {
        if (root.visible) {
            transOut.running = true;
        } else {
            transIn.running = true;
        }
    }
    anchors {
        top: true
        right: true
        left: true
        bottom: true
    }
    Rectangle {
        id: shaderlayer
        visible: false
        anchors.fill: parent
        color: Etc.background
        // Image {
        //     x: Etc.scale * 20
        //     y: Etc.scale * 32
        //     source: "./layout.png"
        //     height: 320 * Etc.scale
        //     width: 600 * Etc.scale
        //     smooth: false
        // }
        // layer.enabled: false
        layer.enabled: true
        layer.effect: ShaderEffect {
            id: shader
            fragmentShader: "../shaders/noise.frag.qsb"
            vertexShader: "../shaders/default.vert.qsb"
            property vector2d resolution: Qt.vector2d(width, height)
            property real time: 0
            property int pixelSize: Etc.scale
            property real barSize: 1.5
            property real barStrength: 0.3
            property real shiftStrength: 0.15
            property real warp: 0.07
            property real brightness: 1.5
            property vector2d mouseCoord: Qt.vector2d(cursor.mouseX, height - cursor.mouseY)
            property ShaderEffectSource iChannel0: ShaderEffectSource {
                sourceItem: shaderlayer
                textureMirroring: ShaderEffectSource.NoMirroring
            }
            // FrameAnimation {
            //     running: true;
            //     onTriggered: {
            //         shader.time = this.elapsedTime;
            //     }
            // }
        }
        StyledTextVisitor {
            text: "GENERATiON  \nLAndvermessungs-/\nschiff-techniker\nReplika"
            horizontalAlignment: Text.AlignRight
            lineHeight: 6 * Etc.scale
            lineHeightMode: Text.FixedHeight
            color: Etc.foreground
            x: 39 * Etc.scale
            y: 304 * Etc.scale
            StyledTextVisitor {
                text: "5"
                x: 92 * Etc.scale
                color: Etc.accent
            }
            StyledTextVisitor {
                text: "V.5.6.1"
                x: 536 * Etc.scale
                y: 18 * Etc.scale
                color: Etc.foreground
            }
        }
        Receiver {
            x: 39 * Etc.scale
            y: 38 * Etc.scale
        }
        Memory {
            rootId: root
            x: 194 * Etc.scale
            y: 38 * Etc.scale
        }
        Diagnostics {
            x: 409 * Etc.scale
            y: 38 * Etc.scale
        }
    }
    MouseArea {
        id: cursor
        anchors.fill: parent
        hoverEnabled: true
        propagateComposedEvents: true
        preventStealing: true
        cursorShape: Qt.BlankCursor
    }
    Image {
        id: tvBorder
        visible: false
        anchors.centerIn: parent
        width: parent.width * 1.025
        height: parent.height * 1.025
        source: "./inventory_screenBorder.png"
        fillMode: Image.PreserveAspectCrop
        horizontalAlignment: Image.AlignLeft
        verticalAlignment: Image.AlignTop
        smooth: false
    }
    Rectangle {
        id: trans
        anchors.fill: parent
        color: "black"
        opacity: 1.0

        SequentialAnimation {
            id: transIn
            running: false
            PropertyAction {
                target: root
                property: "visible"
                value: true
            }
            NumberAnimation {
                target: trans
                property: "opacity"
                to: 1.0
                duration: Etc.transitionSpeed
            }
            PropertyAction {
                target: tvBorder
                property: "visible"
                value: true
            }
            PropertyAction {
                target: shaderlayer
                property: "visible"
                value: true
            }
            NumberAnimation {
                target: trans
                property: "opacity"
                to: 0.0
                duration: Etc.transitionSpeed
            }
        }
        SequentialAnimation {
            id: transOut
            running: false
            NumberAnimation {
                target: trans
                property: "opacity"
                to: 1.0
                duration: Etc.transitionSpeed
            }
            PropertyAction {
                target: tvBorder
                property: "visible"
                value: false
            }
            PropertyAction {
                target: shaderlayer
                property: "visible"
                value: false
            }
            NumberAnimation {
                target: trans
                property: "opacity"
                to: 0.0
                duration: Etc.transitionSpeed
            }
            PropertyAction {
                target: root
                property: "visible"
                value: false
            }
        }
    }
}
