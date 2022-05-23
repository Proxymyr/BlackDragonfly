import QtQuick 2.15
import QtQml 2.15
import QtQuick.Controls 2.15

Item {

  property QtObject enemy: null

  Row {
    anchors.centerIn: parent
    spacing: 50

    Loader {
      id: _enemyLoader
      width: _player.width
      height: _player.height
    }

    Player {
      id: _player
      onHit: {
        _enemyLoader.item.health -= 50;
      }
    }
  }

  Timer {
    id: _respawn
    interval: 1000
    running: true

    onTriggered: {
      _enemyLoader.sourceComponent = _componentEnemy;
    }
  }

  function tick(interval) {
    _player.progress(interval);
  }

  Component {
    id: _componentEnemy
    Enemy {
      id: _enemy
      onDeath: {
        _enemyLoader.sourceComponent = null;
        _respawn.restart();
      }
    }
  }
}
