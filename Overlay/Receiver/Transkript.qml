import QtQuick
import "../../Shared"

Rectangle {
    width: 140 * Etc.scale
    height: 71 * Etc.scale
    color: Etc.accent
    StyledTextVisitor {
        anchors.horizontalCenter: parent.horizontalCenter
        text: Players.activeIdentity
        color: Etc.background
    }
    Rectangle {
        id: rect
        width: 138 * Etc.scale
        height: 61 * Etc.scale
        x: 1 * Etc.scale
        y: 9 * Etc.scale
        color: Etc.background

        Item {
            id: margin
            anchors {
                fill: parent
                leftMargin: 2 * Etc.scale
                rightMargin: 2 * Etc.scale
            }
            visible: Players.active
            clip: true
            StyledTextVisitor {
                id: title
                height: 9 * Etc.scale
                text: Players.active?.trackTitle || "- NO DATA -"
                color: Etc.active
                fontSizeMode: Text.VerticalFit 
                x: parent.width / 2 - paintedWidth / 2
                SequentialAnimation {
                    running: margin.width - title.paintedWidth < 0
                    loops: Animation.Infinite
                    NumberAnimation {
                        target: title
                        property: "x"
                        to: (margin.width - title.paintedWidth) - 2
                        duration: 2000
                    }
                    PauseAnimation {
                        duration: 5000
                    }
                    NumberAnimation {
                        target: title
                        property: "x"
                        to: 2
                        duration: 2000
                    }
                    PauseAnimation {
                        duration: 5000
                    }
                }

                SequentialAnimation {
                    running: margin.width - title.paintedWidth >= 0
                    NumberAnimation {
                        target: title
                        property: "x"
                        to: (margin.width - title.paintedWidth) / 2
                        duration: 1
                    }
                }
            }
            StyledTextVisitor {
                id: album
                height: 9 * Etc.scale
                text: Players.active?.trackAlbum || "- NO DATA -"
                color: Etc.active
                fontSizeMode: Text.VerticalFit 
                x: parent.width / 2 - paintedWidth / 2
                y: title.y + 7 * Etc.scale
                SequentialAnimation {
                    running: margin.width - album.paintedWidth < 0
                    loops: Animation.Infinite
                    NumberAnimation {
                        target: album
                        property: "x"
                        to: (margin.width - album.paintedWidth) - 2
                        duration: 2000
                    }
                    PauseAnimation {
                        duration: 5000
                    }
                    NumberAnimation {
                        target: album
                        property: "x"
                        to: 2
                        duration: 2000
                    }
                    PauseAnimation {
                        duration: 5000
                    }
                }

                SequentialAnimation {
                    running: margin.width - album.paintedWidth >= 0
                    NumberAnimation {
                        target: album
                        property: "x"
                        to: (margin.width - album.paintedWidth) / 2
                        duration: 1
                    }
                }
            }
            StyledTextVisitor {
                id: artist
                height: 9 * Etc.scale
                text: Players.active?.trackArtist || "- NO DATA -"
                color: Etc.active
                fontSizeMode: Text.VerticalFit 
                x: parent.width / 2 - paintedWidth / 2
                y: album.y + 7 * Etc.scale
                SequentialAnimation {
                    running: margin.width - artist.paintedWidth < 0
                    loops: Animation.Infinite
                    NumberAnimation {
                        target: artist
                        property: "x"
                        to: (margin.width - artist.paintedWidth) - 2
                        duration: 2000
                    }
                    PauseAnimation {
                        duration: 5000
                    }
                    NumberAnimation {
                        target: artist
                        property: "x"
                        to: 2
                        duration: 2000
                    }
                    PauseAnimation {
                        duration: 5000
                    }
                }

                SequentialAnimation {
                    running: margin.width - artist.paintedWidth >= 0
                    NumberAnimation {
                        target: artist
                        property: "x"
                        to: (margin.width - artist.paintedWidth) / 2
                        duration: 1
                    }
                }
            }
        }
    }
}
