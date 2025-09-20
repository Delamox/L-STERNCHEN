import QtQuick
import "../../Shared"

Rectangle {
    width: 140 * Etc.scale
    height: 71 * Etc.scale
    color: Etc.accent
    StyledTextVisitor {
        anchors.horizontalCenter: parent.horizontalCenter
        text: "TRANSKRiption"
        color: Etc.background
    }
    Rectangle {
        width: 138 * Etc.scale
        height: 61 * Etc.scale
        x: 1 * Etc.scale
        y: 9 * Etc.scale
        color: Etc.background
        Item {
            anchors.fill: parent
            visible: Players.active
            StyledTextVisitor {
                width: parent.width - 4 * Etc.scale
                height: 9 * Etc.scale
                x: parent.width / 2 - paintedWidth / 2
                y: 4.5 * Etc.scale - paintedHeight / 2
                text: Players.active?.trackTitle || "- NO DATA -"
                fontSizeMode: Text.Fit 
                clip: true
                color: "white"
            }
            StyledTextVisitor {
                width: parent.width - 4 * Etc.scale
                height: 9 * Etc.scale
                x: parent.width / 2 - paintedWidth / 2
                y: 11.5 * Etc.scale - paintedHeight / 2
                text: Players.active?.trackAlbum || "- NO DATA -"
                fontSizeMode: Text.Fit 
                color: "white"
            }
            StyledTextVisitor {
                width: parent.width - 4 * Etc.scale
                height: 9 * Etc.scale
                x: parent.width / 2 - paintedWidth / 2
                y: 18.5 * Etc.scale - paintedHeight / 2
                text: Players.active?.trackArtist || "- NO DATA -"
                fontSizeMode: Text.Fit            
                clip: true
                color: "white"
            }
            Image {
                id: img
                x: parent.width / 2 - paintedWidth / 2
                width: 36 * Etc.scale
                height: 36 * Etc.scale
                y: 23 * Etc.scale
                source: Players.active?.trackArtUrl || ""
            }
        }
    }
}
