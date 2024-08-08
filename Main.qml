import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("amplitude Example")

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Screen1 {}
    }
}
