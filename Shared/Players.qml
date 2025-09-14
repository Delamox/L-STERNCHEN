//property of sora
pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris

Singleton {
    id: root
    readonly property list<MprisPlayer> list: Mpris.players.values
    readonly property MprisPlayer active: manualActive ?? list.find(p => p.identity === "Spotify") ?? list[0] ?? null
    // readonly property MprisPlayer active: list[0] ?? null
    property MprisPlayer manualActive
    function getActive(prop: string): string {
        const active = root.active;
        return active ? active[prop] ?? "Invalid property" : "No active player";
    }
    function list(): string {
        return root.list.map(p => p.identity).join("\n");
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
}
