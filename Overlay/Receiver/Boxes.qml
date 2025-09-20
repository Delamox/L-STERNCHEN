import QtQuick
import "../../Shared"

Item {
    height: 105 * Etc.scale
    width: 33 * Etc.scale
    Box {
        label: "tuner"
        activated: Players.active
    }
    Box {
        y: 16 * Etc.scale
        label: "WELLE"
        activated: Players.active
    }
    Box {
        y: 32 * Etc.scale
        label: "ATT"
    }
    Box {
        y: 48 * Etc.scale
        label: "BURST"
        activated: Players.active
    }
    Box {
        y: 64 * Etc.scale
        label: "TEST"
    }
    Box {
        y: 80 * Etc.scale
        label: "sigNal"
        offset: 1
        activated: (Cava.values.every(item => item === 0)) ? false : true
    }
    Box {
        y: 96 * Etc.scale
        label: "DATA"
        activated: (Players.active) ? Players.active.isPlaying : false
    }
}
