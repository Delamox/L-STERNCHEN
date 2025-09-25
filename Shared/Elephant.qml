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
    property var desktopEntry
    // property string test
    Process {
        id: searchDesktopProc
        command: [qsTr("%1/Shared/Elephant.sh").arg(Quickshell.shellDir), root.query]
        stdout: StdioCollector {
            // onStreamFinished: {root.test = this.text}
            onStreamFinished: {root.search = JSON.parse(this.text)}
        }
    }
    Process {
        id: launchDesktopProc
        command: ["elephant", "activate", qsTr("%1;desktopapplications;%2;open;").arg(root.desktopEntry.id).arg(root.desktopEntry.ident)]
    }
    Process {
        running: true
        command: ["elephant"]
    }
    function launchDesktop(query: var) {
        root.desktopEntry = query;
        launchDesktopProc.running = true;
    }
    function searchDesktop(query: string): var {
        root.query = query;
        searchDesktopProc.running = true;
    }
}
