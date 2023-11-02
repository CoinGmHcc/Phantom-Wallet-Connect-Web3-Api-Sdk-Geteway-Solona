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
    id: containerCreateWalletConfirmationView
    width: 750
    height: 750
    radius: Theme.containerRadius
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
          top: containerCreateWalletConfirmationView.top
          topMargin: 40
        }
        source: "../images/phantomwalletlogo.png"
        width: 100
        height: 100
    }

    // Label title
    Label {
        id: labelPhantom
        text: "Wallet Created!"
        font.family: customGoogleFont.name
        font.pixelSize: 40
        anchors {
          horizontalCenter: parent.horizontalCenter
          top: logoPhantom.bottom
          topMargin: 20
        }
    }

    Rectangle {
        id: panelWarning
        width: 641
        height: 69
        anchors {
          horizontalCenter: labelPhantom.horizontalCenter
          top: labelPhantom.bottom
          topMargin: 20
        }
        color: "#fcf8e3"
        border {
          color: "#faebcc"
          width: 1.5
        }

        // Label title
        Label {
            id: labelPhantomaaa
            text: "Warning!<br>You should save the private key in a safe place. It won't be displayed again."
            font.family: customGoogleFont.name
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "#8a6d3b"
            anchors {
              horizontalCenter: parent.horizontalCenter
              verticalCenter: parent.verticalCenter
            }
        }
    }

    // createTab Page
    Rectangle {
        id: createTab

            // Label title
            Label {
                id: labelWalletName
                text: "Wallet name"
                color: "#7C95AB"
                font.pixelSize: 20
                font.family: customGoogleFont.name
                width: 445
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                x: 163
                y: 320
            }
            // account name
            TextInput {
                id: textWalletName
                echoMode: TextInput.Normal
                readOnly: true
                selectByMouse: true
                selectionColor: "grey"
                color: "#efefef"
                font.pixelSize: 14
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors {
                  top: labelWalletName.bottom
                  left: labelWalletName.left
                  //topMargin: 20
                }
                width: 445
                height: 25
                //validator: IntValidator {bottom: 0; top: 10;}
                text: qsTr("mywallet")
                Keys.onReleased: {
                    if (event.key === Qt.Key_Return) {
                        savedTabButton.onClicked()
                    }
                }
            }

            // Label title
            Label {
                id: labelPassword
                text: "Wallet password"
                color: "#7C95AB"
                font.pixelSize: 20
                font.family: customGoogleFont.name
                width: 445
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors {
                  top: textWalletName.bottom
                  left: textWalletName.left
                  topMargin: 10
                }
            }
            // account password 1
            TextInput {
                id: textPassword
                echoMode: TextInput.Normal
                readOnly: true
                selectByMouse: true
                selectionColor: "grey"
                color: "#efefef"
                font.pixelSize: 14
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                width: 445
                height: 25
                anchors {
                  top: labelPassword.bottom
                  left: labelPassword.left
                  //topMargin: 10
                }
                //validator: IntValidator {bottom: 0; top: 10;}
                text: qsTr("mypassword")
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
                        right: textPassword.right
                        top: textPassword.top
                        rightMargin: -50
                        topMargin: -15
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

            // Label title
            Label {
                id: labelPrivateKey
                font.pixelSize: 20
                text: "Wallet private key"
                font.family: customGoogleFont.name
                color: "#7C95AB"
                width: 445
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors {
                  top: textPassword.bottom
                  left: textPassword.left
                  topMargin: 10
                }
            }
            // account password 2
            TextInput {
                id: textPrivateKey
                echoMode: TextInput.Normal
                readOnly: true
                selectByMouse: true
                selectionColor: "grey"
                color: "#efefef"
                font.pixelSize: 14
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors {
                  top: labelPrivateKey.bottom
                  left: labelPrivateKey.left
                  //topMargin: 10
                }
                width: 445
                height: 25
                //validator: IntValidator {bottom: 0; top: 10;}
                text: qsTr("L2LGgkZAdupN2ee8Rs6hpkc65zaGcLbxhbSDGq8oh6umUxxzeW25")
                Keys.onReleased: {
                    if (event.key === Qt.Key_Return) {
                        savedTabButton.onClicked()
                    }
                }
                // button toggle password type
                Button {
                    id: togglePasswordType22222
                    icon.source: "../images/phantomwalletlogo.png"
                    background: Qt.transparent
                    anchors {
                        right: textPrivateKey.right
                        top: textPrivateKey.top
                        rightMargin: -50
                        topMargin: -15
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

            // Label title
            Label {
                id: labelPublicAddress1
                text: "NEO public address"
                font.pixelSize: 20
                font.family: customGoogleFont.name
                color: "#7C95AB"
                width: 445
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors {
                  top: textPrivateKey.bottom
                  left: textPrivateKey.left
                  topMargin: 10
                }
            }
            // account password 2
            TextInput {
                id: textPublicAddress1
                echoMode: TextInput.Normal
                readOnly: true
                selectByMouse: true
                selectionColor: "grey"
                color: "#efefef"
                font.pixelSize: 14
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors {
                  top: labelPublicAddress1.bottom
                  left: labelPublicAddress1.left
                  //topMargin: 10
                }
                width: 445
                height: 25
                //validator: IntValidator {bottom: 0; top: 10;}
                text: qsTr("P2K6Sm1bUYGsFkxuzHPhia1AbANZaHBJV54RgtQi5q8oK34")
                Keys.onReleased: {
                    if (event.key === Qt.Key_Return) {
                        savedTabButton.onClicked()
                    }
                }
                // button toggle password type
                Button {
                    id: togglePasswordType222
                    //anchors.left: parent.left
                    //anchors.leftMargin: 0
                    icon.source: "../images/phantomwalletlogo.png"
                    background: Qt.transparent
                    anchors {
                        right: textPublicAddress1.right
                        top: textPublicAddress1.top
                        rightMargin: -50
                        topMargin: -15
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

            // Label title
            Label {
                id: labelPublicAddress2
                text: "Phantasma public address"
                font.pixelSize: 20
                font.family: customGoogleFont.name
                color: "#7C95AB"
                width: 445
                horizontalAlignment: Text.AlignLeft
                anchors {
                  top: textPublicAddress1.bottom
                  left: textPublicAddress1.left
                  topMargin: 10
                }
            }
            // account password 2
            TextInput {
                id: textPublicAddress2
                echoMode: TextInput.Normal
                readOnly: true
                selectByMouse: true
                selectionColor: "grey"
                color: "#efefef"
                font.pixelSize: 14
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                width: 445
                height: 25
                //validator: IntValidator {bottom: 0; top: 10;}
                text: qsTr("P2K6Sm1bUYGsFkxuzHPhia1AbANZaHBJV54RgtQi5q8oK34")
                anchors {
                  top: labelPublicAddress2.bottom
                  left: labelPublicAddress2.left
                  //topMargin: 10
                }
                Keys.onReleased: {
                    if (event.key === Qt.Key_Return) {
                        savedTabButton.onClicked()
                    }
                }

                // button toggle password type
                Button {
                    id: togglePasswordType22
                    icon.source: "../images/phantomwalletlogo.png"
                    background: Qt.transparent
                    anchors {
                        right: textPublicAddress2.right
                        top: textPublicAddress2.top
                        rightMargin: -50
                        topMargin: -15
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

    }
}