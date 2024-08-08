import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: screen1Id

    Column {
        anchors.margins: 10
        spacing: 20

        Text {
            id: idText
            text: "Screen 1"
            font.pixelSize: 24
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Button {
            text: "Button 1"
            onClicked: {
                console.log("Button 1 clicked")
                amplitudeTracker.trackEvent("Screen11ButtonClicked");
            }
        }

        Button {
            text: "Button 2"
            onClicked: {
                console.log("Button 2 clicked")
                amplitudeTracker.trackEvent("Screen12ButtonClicked");
            }
        }

        Button {
            text: "Button 3"
            onClicked: {
                console.log("Button 3 clicked")
                amplitudeTracker.trackEvent("Screen13ButtonClicked");
            }
        }
    }

    Button {
        text: "Next"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 10
        onClicked: stackView.push(Qt.resolvedUrl("Screen2.qml"))
    }
}
