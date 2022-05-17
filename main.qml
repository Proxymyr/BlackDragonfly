import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Project Black Dragonfly")

    readonly property int tickPerSecond: 50

    ProgressBar {
        id: _progressBar
        from: 0
        to: 2000
        value: 0
        height: 15

        contentItem: Rectangle {
            width: _progressBar.visualPosition * parent.width
            color: "red"
        }

        onValueChanged: {
            value %= to;
        }

    }

    Timer {
        interval: 1000 / tickPerSecond
        repeat: true
        running: true

        onTriggered: {
            _progressBar.value += interval;
        }
    }
}
