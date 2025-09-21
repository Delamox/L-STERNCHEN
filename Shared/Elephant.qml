// property of sora
pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

Singleton {
    id: root
    property var search
    property string query

    Process {
        id: proc
        // command: ["bash", "/home/del/git/Signalis/Shared/Elephant.sh", "spotify"]
        command: ["bash", qsTr("%1/Shared/Elephant.sh").arg(Quickshell.shellDir), root.query]
        stdout: StdioCollector {
            onStreamFinished: root.search = JSON.parse(this.text);
        }
    }

    function searchDesktop(query: string): var {
        root.query = query;
        proc.running = true;
    }
}
