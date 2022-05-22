import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15

Window {
  width: 1280
  height: 720
  visible: true
  title: qsTr("Project Black Dragonfly")

  readonly property int ticksPerSecond: 50

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

    StackLayout {
      anchors.fill: parent

      BattleScreen {
        id: _battleScreen
      }


    }
  }

  Timer {
    interval: 1000 / ticksPerSecond
    repeat: true
    running: true

    onTriggered: {
      _battleScreen.tick(interval);
    }
  }
}
