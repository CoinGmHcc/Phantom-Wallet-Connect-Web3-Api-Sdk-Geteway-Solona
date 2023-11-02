import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.1

import "../fonts/FontAwesome/";
import "../js/theme.js" as Theme;
import "../js/utils.js" as Utils;
import "../components";
import "../components" as PhantomComponents;

Rectangle {
    id: containerPortfolioView
    width: 750
    height: 750
    radius: 30
    color: Theme.containerBackgroundColor
    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
      verticalCenterOffset: 0
      horizontalCenterOffset: 0
    }

    // Label version
    Label {
        id: labelVersion
        text: "v1.0.0"
        font.family: customGoogleFont.name
        anchors {
          horizontalCenter: parent.horizontalCenter
          bottom: parent.bottom
          bottomMargin: 20
        }
        color: Theme.textColor
    }

    // Logo phantom
    Image {
        id: logoPhantom
        anchors {
          horizontalCenter: parent.horizontalCenter
          top: containerPortfolioView.top
          topMargin: 40
        }
        source: "../images/phantomwalletlogo.png"
        width: 100
        height: 100
    }

    // Label title
    Label {
        id: labelPhantom
        text: "Portfolio"
        font.family: customGoogleFont.name
        font.pixelSize: 40
        anchors {
          horizontalCenter: parent.horizontalCenter
          top: logoPhantom.bottom
          topMargin: 20
        }
    }

    // createTab Page
    Rectangle {
        id: createTab

        Item {
            // account name
            TextField {
                id: createAccountName
                echoMode: TextInput.Normal
                x: 163
                y: 294
                width: 432
                height: 60
                //validator: IntValidator {bottom: 0; top: 10;}
                placeholderText: qsTr("address")
                Keys.onReleased: {
                    if (event.key === Qt.Key_Return) {
                        savedTabButton.onClicked()
                    }
                }
            }

            // account password 1
            TextField {
                id: createAccountPassword1
                echoMode: TextInput.Password
                x: 163
                y: 369
                width: 432
                height: 60
                //validator: IntValidator {bottom: 0; top: 10;}
                placeholderText: qsTr("address")
                Keys.onReleased: {
                    if (event.key === Qt.Key_Return) {
                        savedTabButton.onClicked()
                    }
                }
            }

            // Button Back
            Button {
                id: buttonBack
                x: 325
                y: 605
                width: 90
                height: 40
                flat: true
                opacity: 0.8
                text: qsTr("Back")
                onClicked: switchMainViews(0)
            }
        }
    }
}