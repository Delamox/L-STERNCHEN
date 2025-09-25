import QtQuick
import Quickshell.Hyprland
import "../../Shared"
// make sure to have some bleach on hand for your eyes because this code is ass, i am not fixing it because i am afraid of it myself

Rectangle {
    property var offset: [0,1,2,3,4,5,6,7,8,9,10,11,12]
    property int highest: 6
    property var current
    property var contain: Elephant.search.response
    property var rootId
    id: root
    width: 210 * Etc.scale
    height: 266 * Etc.scale
    color: (text.focus) ? Etc.active : Etc.accent
    MouseArea {
        anchors.fill: parent
        onClicked: text.focus = true;
    }
    function mod(a,n) { // this fucking language can burn in hell together with its creators the fucking % operator isn't even a real modulo operator it just fakes it, spent 2 hours fixing a bug that wasn't even mine seriously fuck this shit bruh bitchass fake language
        return ((a%n)+n)%n;
    }
    function up() {
        if (contain.length > 1) {
            offset.forEach((element, index) => {
                if (element == 0) {
                    offset[index] = 12
                } else {
                    offset[index] = element - 1
                }
            })
            rep.children.forEach((element) => {
                element.refresh(1);
            })
        }
    }
    function down() {
        if (contain.length > 1) {
            offset.forEach((element, index) => {
                if (element == 12) {
                    offset[index] = 0
                } else {
                    offset[index] = element + 1
                }
            })
            rep.children.forEach((element) => {
                element.refresh(-1);
            })
        }
    }
    function reset(q) {
        Elephant.searchDesktop(q);
    }
    function load() {
        highest = 6
        rep.children.forEach((element) => {
            element.clean()
        })
    }
    // property string test: Elephant.test
    // onTestChanged: {
    //     console.log(test);
    // }
    onContainChanged: load()
    Component.onCompleted: reset("")
    Rectangle {
        id: container
        width: 208 * Etc.scale
        height: 256 * Etc.scale
        x: 1 * Etc.scale
        y: 9 * Etc.scale
        color: Etc.background
        clip: true
        Rectangle {
            width: 2 * Etc.scale
            height: 9 * Etc.scale
            x: 3 * Etc.scale
            y: 119 * Etc.scale
            color: Etc.foreground
        }
        Rectangle {
            width: 2 * Etc.scale
            height: 9 * Etc.scale
            x: 203 * Etc.scale
            y: 119 * Etc.scale
            color: Etc.foreground
        }
        Item {
            id: rep
            Repeater {
                model: 13
                function refresh(e) {}
                function clean() {}
                Book {
                    required property var modelData
                    property var desktopItem
                    function clean() {
                        listcalc(offset[modelData]);
                        refresh(0);
                    }
                    function refresh(e) {
                        // i am losing my sanity
                        visible = (root.offset[modelData] == 12 || root.offset[modelData] == 0) ? false : true
                        bookColor = (root.offset[modelData] < 6) ? Etc.foreground : (root.offset[modelData] == 6) ? Etc.accent : Etc.highground
                        y = 202 * Etc.scale - (root.offset[modelData] - 1) * 17 * Etc.scale;
                        if (root.offset[modelData] == 0 && e == -1) {
                            highest = highest - 1
                            desktopItem = (contain.length) ? contain[mod(contain.length + highest - 12, contain.length)] : desktopItem
                            label = desktopItem.name
                        } else if (root.offset[modelData] == 12 && e == 1) {
                            highest = highest + 1
                            desktopItem = (contain.length) ? contain[mod(highest, contain.length)] : desktopItem
                            label = desktopItem.name
                        } else if (root.offset[modelData] == 6) {
                            current = desktopItem;
                        }
                    }
                    function listcalc(e) {
                        if (contain.length > 1) {
                            let c = 0
                            if (e == 6) {
                                c = 0
                            } else if (e > 6) {
                                c = mod(e - 6, contain.length)
                            } else if (e < 6) {
                                let inv = -1 * (6 - e)
                                c = mod(contain.length + inv, contain.length)
                            }
                            desktopItem = contain[c]
                            label = desktopItem.name
                            vis = true
                        } else if (contain.length == 1){
                            if (e == 6) {
                                desktopItem = contain[0]
                                label = desktopItem.name
                                vis = true
                            } else {
                                label = ""
                                vis = false
                            }
                        } else {
                            if (e != 6) {
                                label = ""
                                vis = false
                            }
                        }
                    }
                    x: 8 * Etc.scale
                    Behavior on y {
                        NumberAnimation {duration: 200}
                    }
                    Behavior on bookColor {
                        ColorAnimation {duration: 200}
                    }
                }
            }
        }
        Rectangle {
            anchors.fill: parent
            gradient: Gradient {
                GradientStop {position: 0.2; color: Etc.background}
                GradientStop {position: 0.5; color: "transparent"}
                GradientStop {position: 0.8; color: Etc.background}
            }
        }
        Rectangle {
            width: 90 * Etc.scale
            height: 11 * Etc.scale
            x: 59 * Etc.scale
            y: 240 * Etc.scale
            color: Etc.active
            clip: true
            GlobalShortcut {
                name: "launcher"
                appid: "quickshell"
                onPressed: {
                    if (!rootId.visible) {
                        rootId.toggleVis();
                    }
                    text.focus = true;
                    text.text = "";
                    reset(text.text);
                }
            }
            TextInput {
                id: text
                anchors.fill: parent
                onTextEdited: {
                    reset(text.text)
                }
                onAccepted: {
                    Elephant.launchDesktop(current);
                    rootId.toggleVis()
                }
                Keys.onUpPressed: up()
                Keys.onDownPressed: down()
                font.family: visitor2.font.family
                font.pointSize: 13 * Etc.scale / 7 * 5
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter
                selectionColor: Etc.accent
                selectedTextColor: "black";
            }
        }
        Rectangle {
            width: 90 * Etc.scale
            height: 11 * Etc.scale
            x: 59 * Etc.scale
            y: 5 * Etc.scale
            color: Etc.active
            StyledTextVisitor {
                anchors.centerIn: parent
                text: "memory"
                color: Etc.background
            }
        }
    }
}
