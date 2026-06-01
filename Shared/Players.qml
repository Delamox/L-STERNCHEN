//adapted from sora @ https://github.com/caelestia-dots/shell/blob/main/services/Players.qml
pragma Singleton

import QtQml
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris

Singleton {
    id: root

    readonly property list<MprisPlayer> list: Mpris.players.values
    readonly property MprisPlayer active: props.manualActive ?? list.find(p => getIdentity(p) === "spotify-player") ?? list[0] ?? null
    property alias manualActive: props.manualActive

    function getIdentity(player: MprisPlayer): string {
        // const alias = GlobalConfig.services.playerAliases.find(a => a.from === player.identity);
        // return alias?.to ?? player.identity;
        return player.identity
    }

    // component.onCompleted {
    //     console.log
    // }

    function getArtUrl(player: MprisPlayer): string {
        if (!player)
            return "";
        if (player.trackArtUrl)
            return player.trackArtUrl;

        const url = player.metadata["xesam:url"] ?? "";
        if (url.startsWith("https://www.youtube.com/watch")) {
            // Fallback for youtube
            const id = url.match(/[?&]v=([\w-]{11})/)?.[1];
            return id ? `https://img.youtube.com/vi/${id}/hqdefault.jpg` : "";
        }
        return "";
    }

    PersistentProperties {
        id: props

        property MprisPlayer manualActive

        reloadableId: "players"
    }

    IpcHandler {
        function getActive(prop: string): string {
            const active = root.active;
            return active ? active[prop] ?? "Invalid property" : "No active player";
        }

        function list(): string {
            return root.list.map(p => root.getIdentity(p)).join("\n");
        }

        function play(): void {
            const active = root.active;
            if (active?.canPlay)
                active.play();
        }

        function pause(): void {
            const active = root.active;
            if (active?.canPause)
                active.pause();
        }

        function playPause(): void {
            const active = root.active;
            if (active?.canTogglePlaying)
                active.togglePlaying();
        }

        function previous(): void {
            const active = root.active;
            if (active?.canGoPrevious)
                active.previous();
        }

        function next(): void {
            const active = root.active;
            if (active?.canGoNext)
                active.next();
        }

        function stop(): void {
            root.active?.stop();
        }

        function seek(e): void {
            const active = root.active
            if (active?.canSeek)
                active.seek(e);
        }

        target: "mpris"
    }
}
