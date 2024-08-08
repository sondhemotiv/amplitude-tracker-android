import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: scr2Id

    Column {
        anchors.margins: 10
        spacing: 20

        Text {
            id: idText
            text: "Screen 2"
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
                amplitudeTracker.trackEvent("Screen21ButtonClicked");
            }
        }

        Button {
            text: "Button 2"
            onClicked: {
                console.log("Button 2 clicked")
                amplitudeTracker.trackEvent("Screen22ButtonClicked");
            }
        }

        Button {
            text: "Button 3"
            onClicked: {
                console.log("Button 3 clicked")
                amplitudeTracker.trackEvent("Screen23ButtonClicked");
            }
        }
    }

    Button {
        text: "Back"
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 10
        onClicked: stackView.pop()
    }
}
