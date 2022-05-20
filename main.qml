import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 1280
    height: 720
    visible: true
    title: qsTr("Project Black Dragonfly")

    readonly property int tickPerSecond: 50

    Item {
        id: _itemSidebar
        width: 320
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }

        Column {

        }

        Rectangle {
            anchors.fill: parent
            color: "beige"
        }
    }

    Item {
        id: _itemScene
        anchors {
            left: _itemSidebar.right
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }

        Row {
            anchors.centerIn: parent
            spacing: 50

            Enemy {
                id: _dummy
            }

            Player {
                id: _player
                onHit: {
                    _dummy.health -= 10;
                }
            }
        }
    }

    Timer {
        interval: 1000 / tickPerSecond
        repeat: true
        running: true

        onTriggered: {
            _player.progress(interval);
        }
    }
}
