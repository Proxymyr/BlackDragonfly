import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import Qt.labs.settings 1.1

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

    Rectangle {
      anchors.fill: parent
      color: "beige"
    }

    Column {
        id: _colSidebar

        anchors.centerIn: parent

        Button {
            id: _buttonBattleScreen
            text: "Battle"

            onClicked: {
                _stackLayoutScene.currentIndex = 0;
            }
        }

        Button {
            id: _buttonInventory
            text: "Inventory"

            onClicked: {
                _stackLayoutScene.currentIndex = 1;
            }
        }
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
      id: _stackLayoutScene
      anchors.fill: parent

      BattleScreen {
        id: _battleScreen
      }

      InventoryScreen {
          id: _inventoryScreen
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

  //TODO : Save data
  /*Component.onCompleted: {
    PlayerData = _settings.playerData;
  }

  Component.onDestruction: {
      _settings.playerData = PlayerData;
  }

  Settings {
    id: _settings

    property PlayerData playerData: PlayerData
  }*/
}
