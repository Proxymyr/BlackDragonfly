import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 960
    height: 540
    visible: true
    title: qsTr("Project Black Dragonfly")

    readonly property int tickPerSecond: 50

    Row {
        Player {
            id: _dummy
        }

        Player {
            id: _player
            onHit: {
                _dummy.health -= 10;
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
