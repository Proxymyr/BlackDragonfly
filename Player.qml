import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: _self
    signal hit()
    property alias health: _progressBarHealth.value
    implicitWidth: _column.implicitWidth
    implicitHeight: _column.implicitHeight

    Column {
        id: _column

        ProgressBar {
            id: _progressBarHealth
            from: 0
            to: 100
            value: 100
            height: 15

            contentItem: Rectangle {
                width: _progressBarHealth.visualPosition * parent.width
                color: "red"
            }

            onValueChanged: {
                value %= to;
            }
        }

        ProgressBar {
            id: _progressBarAction
            from: 0
            to: 2000
            value: 0
            height: 15

            contentItem: Rectangle {
                width: _progressBarAction.visualPosition * parent.width
                color: "yellow"
            }

            onValueChanged: {
                //La barre est remplie
                if(value >= to) {
                    value %= to;
                    _self.hit();
                }
            }
        }
    }

    function progress(interval) {
        _progressBarAction.value += interval;
    }
}
