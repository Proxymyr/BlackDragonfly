import QtQuick 2.15

Character {
    id: _enemy

    onDeath: {
        console.log("RIP");
    }
}
