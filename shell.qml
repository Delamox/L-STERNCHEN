import QtQuick
import Quickshell
import Quickshell.Hyprland
import "./Overlay"
import "./Shared"
import "./Bar"

PanelWindow {
    id: root
    visible: false;
    Loader {
        active: false
        sourceComponent: Bar {}
    }
    Loader {
        active: true
        sourceComponent: Overlay {}
    }
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
