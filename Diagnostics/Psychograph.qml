import QtQuick
import QtQuick.Layouts
import "../Shared"

Item {
    GridView {
        width: 18 * Etc.scale
        height: 48 * Etc.scale
        x: Etc.scale
        y: 23 * Etc.scale
        cellWidth: 3 * Etc.scale
        cellHeight: 3 * Etc.scale
        model: 96
        interactive: false
        delegate: Pixel {
            color: Etc.lowground
            visible: (y >= (-0.5 * x) + 14)
        }
    }
    GridView {
        width: 39 * Etc.scale
        height: 69 * Etc.scale
        x: 22 * Etc.scale
        y: 2 * Etc.scale
        cellWidth: 3 * Etc.scale
        cellHeight: 3 * Etc.scale
        model: 299
        interactive: false
        delegate: Pixel {
            color: Etc.lowground
            visible: (y >= (-0.5 * x) + 52)
        }
    }
    GridView {
        width: 39 * Etc.scale
        height: 69 * Etc.scale
        x: 62 * Etc.scale
        y: 2 * Etc.scale
        cellWidth: 3 * Etc.scale
        cellHeight: 3 * Etc.scale
        model: 299
        interactive: false
        delegate: Pixel {
            color: Etc.lowground
            visible: (y >= (0.5 * x))
        }
    }
    GridView {
        width: 18 * Etc.scale
        height: 48 * Etc.scale
        x: 104 * Etc.scale
        y: 23 * Etc.scale
        cellWidth: 3 * Etc.scale
        cellHeight: 3 * Etc.scale
        model: 96
        interactive: false
        delegate: Pixel {
            color: Etc.lowground
            visible: (y >= (0.5 * x))
        }
    }
    GridView {
        width: 18 * Etc.scale
        height: 33 * Etc.scale
        x: Etc.scale
        y: 72 * Etc.scale
        cellWidth: 3 * Etc.scale
        cellHeight: 3 * Etc.scale
        model: 66
        interactive: false
        delegate: Pixel {
            color: Etc.lowground
            visible: (y <= (0.5 * x) + 25 * Etc.scale)
        }
    }
    GridView {
        width: 39 * Etc.scale
        height: 54 * Etc.scale
        x: 22 * Etc.scale
        y: 72 * Etc.scale
        cellWidth: 3 * Etc.scale
        cellHeight: 3 * Etc.scale
        model: 234
        interactive: false
        delegate: Pixel {
            color: Etc.lowground
            visible: (y <= (0.5 * x) + 35 * Etc.scale)
        }
    }
    GridView {
        width: 39 * Etc.scale
        height: 54 * Etc.scale
        x: 62 * Etc.scale
        y: 72 * Etc.scale
        cellWidth: 3 * Etc.scale
        cellHeight: 3 * Etc.scale
        model: 234
        interactive: false
        delegate: Pixel {
            color: Etc.lowground
            visible: (y <= (-0.5 * x) + 52 * Etc.scale)
        }
    }
    GridView {
        width: 18 * Etc.scale
        height: 33 * Etc.scale
        x: 104 * Etc.scale
        y: 72 * Etc.scale
        cellWidth: 3 * Etc.scale
        cellHeight: 3 * Etc.scale
        model: 66
        interactive: false
        delegate: Pixel {
            color: Etc.lowground
            visible: (y <= (-0.5 * x) + 32 * Etc.scale)
        }
    }
    Rectangle {
        anchors.centerIn: parent
        height: 124 * Etc.scale
        width: Etc.scale
        color: Etc.lowground
    }
    Item {
        width: 83 * Etc.scale
        height: 83 * Etc.scale
        x: 19 * Etc.scale
        y: 22 * Etc.scale
        Rectangle {
            width: Etc.scale
            height: 42 * Etc.scale
            color: Etc.lowground
        }
        Rectangle {
            width: 40 * Etc.scale
            height: Etc.scale
            color: Etc.lowground
        }
        Rectangle {
            anchors.right: parent.right
            width: 40 * Etc.scale
            height: Etc.scale
            color: Etc.lowground
        }
        Rectangle {
            anchors.right: parent.right
            width: Etc.scale
            height: 42 * Etc.scale
            color: Etc.lowground
        }
        Rectangle {
            anchors.bottom: parent.bottom
            width: Etc.scale
            height: 40 * Etc.scale
            color: Etc.lowground
        }
        Rectangle {
            anchors.bottom: parent.bottom
            width: 40 * Etc.scale
            height: Etc.scale
            color: Etc.lowground
        }
        Rectangle {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            width: 40 * Etc.scale
            height: Etc.scale
            color: Etc.lowground
        }
        Rectangle {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            width: Etc.scale
            height: 40 * Etc.scale
            color: Etc.lowground
        }
    }
    Item {
        width: 29 * Etc.scale
        height: 29 * Etc.scale
        x: 46 * Etc.scale
        y: 49 * Etc.scale
        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            width: 13 * Etc.scale
            height: Etc.scale
            color: Etc.lowground
        }
        Rectangle {
            anchors.top: parent.top
            anchors.right: parent.right
            width: 13 * Etc.scale
            height: Etc.scale
            color: Etc.lowground
        }
        Rectangle {
            width: Etc.scale
            height: 15 * Etc.scale
            color: Etc.lowground
        }
        Rectangle {
            anchors.right: parent.right
            width: Etc.scale
            height: 15 * Etc.scale
            color: Etc.lowground
        }
        Rectangle {
            anchors.bottom: parent.bottom
            width: Etc.scale
            height: 13 * Etc.scale
            color: Etc.lowground
        }
        Rectangle {
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            width: Etc.scale
            height: 13 * Etc.scale
            color: Etc.lowground
        }
        Rectangle {
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: 13 * Etc.scale
            height: Etc.scale
            color: Etc.lowground
        }
        Rectangle {
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            width: 13 * Etc.scale
            height: Etc.scale
            color: Etc.lowground
        }
    }
    Repeater {
        model: 61
        Pixel {
            x: Etc.scale * modelData
            y: Math.floor((modelData + 1)/2) * Etc.scale + 32 * Etc.scale
            color: Etc.lowground
        }
    }
    Repeater {
        model: 61
        Pixel {
            x: Etc.scale * modelData + 60 * Etc.scale
            y: -Math.floor(modelData/2) * Etc.scale + 62 * Etc.scale
            color: Etc.lowground
        }
    }
    Repeater {
        model: 61
        Pixel {
            x: Etc.scale * modelData
            y: -Math.floor((modelData + 1)/2) * Etc.scale + 93 * Etc.scale
            color: Etc.lowground
        }
    }
    Repeater {
        model: 61
        Pixel {
            x: Etc.scale * modelData + 60 * Etc.scale
            y: Math.floor(modelData/2) * Etc.scale + 63 * Etc.scale
            color: Etc.lowground
        }
    }
    Repeater {
        model: 61
        Pixel {
            x: Etc.scale * modelData
            y: -Math.floor((modelData + 1)/2) * Etc.scale + 30 * Etc.scale
            color: Etc.active
        }
    }
    Repeater {
        model: 61
        Pixel {
            x: Etc.scale * modelData + 60 * Etc.scale
            y: Math.floor(modelData/2) * Etc.scale
            color: Etc.active
        }
    }
    Repeater {
        model: 61
        Pixel {
            x: Etc.scale * modelData
            y: Math.floor((modelData + 1)/2) * Etc.scale + 95 * Etc.scale
            color: Etc.active
        }
    }
    Repeater {
        model: 61
        Pixel {
            x: Etc.scale * modelData + 60 * Etc.scale
            y: -Math.floor(modelData/2) * Etc.scale + 125 * Etc.scale
            color: Etc.active
        }
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        height: 66 * Etc.scale
        width: Etc.scale
        color: Etc.active
    }
    Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        height: 66 * Etc.scale
        width: Etc.scale
        color: Etc.active
    }
}
