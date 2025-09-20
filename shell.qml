import QtQuick
import Quickshell
import Quickshell.Hyprland
import "./Overlay"
import "./Shared"

PanelWindow {
    id: root
    visible: false;
    color: "red"
    anchors {
        top: true
        right: true
        left: true
    }
    implicitHeight: 50;
    Overlay {}
    FontLoader {
        id: visitor2
        source: "./fonts/visitor2e.ttf"
    }
    FontLoader {
        id: silver
        source: "./fonts/Silver.ttf"
    }
    FontLoader {
        id: engschrift
        source: "./fonts/DINEngschrift Regular.ttf"
    }
}
