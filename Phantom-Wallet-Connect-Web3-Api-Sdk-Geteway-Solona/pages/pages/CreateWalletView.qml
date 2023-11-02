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
    id: containerCreateWalletView
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
    border {
      color: Theme.containeBorderColor
      width: Theme.borderWidth
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

    // Button Back
    Button {
        id: buttonBack
        width: 90
        height: 40
        flat: true
        opacity: 0.8
        text: qsTr("Back")
        onClicked: switchMainViews(0)
        anchors {
          horizontalCenter: parent.horizontalCenter
          bottom: parent.bottom
          bottomMargin: 75
        }
    }

    // Logo phantom
    Image {
        id: logoPhantom
        anchors {
          horizontalCenter: parent.horizontalCenter
          top: containerCreateWalletView.top
          topMargin: 40
        }
        source: "../images/phantomwalletlogo.png"
        width: 100
        height: 100
    }

    // Label title
    Label {
        id: labelPhantom
        text: "Create Wallet"
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

            // account name
            TextField {
                id: textcreateAccountName
                echoMode: TextInput.Normal
                selectionColor: "grey"
                color: "#efefef"
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                x: 163
                y: 294
                width: 445
                height: 60
                //validator: IntValidator {bottom: 0; top: 10;}
                placeholderText: qsTr("Enter your wallet name")
                Keys.onReleased: {
                    if (event.key === Qt.Key_Return) {
                        savedTabButton.onClicked()
                    }
                }
            }

            // account password 1
            TextField {
                id: createAccountPassword1
                echoMode: TextInput.Normal
                selectionColor: "grey"
                color: "#efefef"
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors {
                  top: textcreateAccountName.bottom
                  left: textcreateAccountName.left
                  //topMargin: 20
                }
                width: 445
                height: 60
                //validator: IntValidator {bottom: 0; top: 10;}
                placeholderText: qsTr("Enter your password")
                Keys.onReleased: {
                    if (event.key === Qt.Key_Return) {
                        savedTabButton.onClicked()
                    }
                }

                // button toggle password type
                Button {
                    id: togglePasswordType22aaa
                    icon.source: "../images/phantomwalletlogo.png"
                    background: Qt.transparent
                    anchors {
                        right: createAccountPassword1.right
                        top: createAccountPassword1.top
                    }
                    onClicked: {
                        if (createAccountPassword1.echoMode == TextInput.Normal) {
                            createAccountPassword1.echoMode = TextInput.Password
                        } else {
                            createAccountPassword1.echoMode = TextInput.Normal
                        }
                    }
                }
            }

            // account password 2
            TextField {
                id: createAccountPassword2
                echoMode: TextInput.Normal
                selectionColor: "grey"
                color: "#efefef"
                font.pixelSize: 16
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors {
                  top: createAccountPassword1.bottom
                  left: createAccountPassword1.left
                  //topMargin: 20
                }
                width: 445
                height: 60
                //validator: IntValidator {bottom: 0; top: 10;}
                placeholderText: qsTr("Confirm your password")
                Keys.onReleased: {
                    if (event.key === Qt.Key_Return) {
                        savedTabButton.onClicked()
                    }
                }

                // button toggle password type
                Button {
                    id: togglePasswordType22aaaa
                    icon.source: "../images/phantomwalletlogo.png"
                    background: Qt.transparent
                    anchors {
                        right: createAccountPassword2.right
                        top: createAccountPassword2.top
                    }
                    onClicked: {
                        if (createAccountPassword2.echoMode == TextInput.Normal) {
                            createAccountPassword2.echoMode = TextInput.Password
                        } else {
                            createAccountPassword2.echoMode = TextInput.Normal
                        }
                    }
                }
            }

            // Login button
            CustomButton {
              id: createTabButton
              text: qsTr("Create Account")
              background: Rectangle {
                  id: createTabButtonCustom
                  implicitWidth: 100
                  implicitHeight: 25
                  border {
                    width: 2
                    color: Theme.buttonBorderColor
                  }
                  radius: 20
                  color: Theme.containerBackgroundColor
              }
              onHoveredChanged: hovered ? createTabButtonCustom.color = Theme.buttonbackgroundColor : createTabButtonCustom.color = Theme.containerBackgroundColor;
              onClicked: switchMainViews(4)
            }
    }
}