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
    id: containerImportWalletView
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

    // Logo phantom
    Image {
        id: logoPhantom
        anchors {
          horizontalCenter: parent.horizontalCenter
          top: containerImportWalletView.top
          topMargin: 40
        }
        source: "../images/phantomwalletlogo.png"
        width: 100
        height: 100
    }

    // Label title
    Label {
        id: labelPhantom
        text: "Import Wallet"
        font.family: customGoogleFont.name
        font.pixelSize: 40
        anchors {
          horizontalCenter: parent.horizontalCenter
          top: logoPhantom.bottom
          topMargin: 20
        }
    }

    // importTab Page
    Rectangle {
        id: importTab
        Item {
            width: 450
            // private key
            TextField {
                id: createAccountPassword1
                echoMode: TextInput.Password
                x: 163
                y: 244
                width: 432
                height: 60
                //validator: IntValidator {bottom: 0; top: 10;}
                placeholderText: qsTr("Enter your private key")
                Keys.onReleased: {
                    if (event.key === Qt.Key_Return) {
                        savedTabButton.onClicked()
                    }
                }

                // button toggle password type
                Button {
                    id: togglePasswordType2
                    x: 390
                    y: 5
                    icon.source: "../images/phantomwalletlogo.png"
                    background: Qt.transparent
                    onClicked: {
                        if (createAccountPassword1.echoMode == TextInput.Normal) {
                            createAccountPassword1.echoMode = TextInput.Password
                        } else {
                            createAccountPassword1.echoMode = TextInput.Normal
                        }
                    }
                }
            }

            // TabBar account options
            TabBar {
                id: tabbarImport
                x: 203
                y: 323
                width: parent.width * 0.75
                currentIndex: 0
                TabButton {
                    text: qsTr("New Account")
                }
                TabButton {
                    text: qsTr("Existing Account")
                }
            }

            // TabBar toggle views
            StackLayout {
                id: stackLayoutImport
                width: 540
                height: 310
                currentIndex: tabbarImport.currentIndex
                anchors {
                  top: createAccountPassword1.bottom
                  topMargin: 20
                }

                onCurrentIndexChanged: {
                    switch (currentIndex) {
                    case 0:
                        newAccountTab.visible = false;
                        existingAccountTab.visible = true;
                        break;
                    case 1:
                        newAccountTab.visible = true;
                        existingAccountTab.visible = false;
                        break;
                    }
                }
            }

            // newAccountTab
            Rectangle {
                id: newAccountTab
                visible: false

                Item {
                  // account name
                  TextField {
                      id: createAccountName
                      echoMode: TextInput.Normal
                      x: 163
                      y: 374
                      width: 432
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
                      id: importAccountPassword2
                      echoMode: TextInput.Password
                      x: 163
                      y: 424
                      width: 432
                      height: 60
                      //validator: IntValidator {bottom: 0; top: 10;}
                      placeholderText: qsTr("Enter a password")
                      Keys.onReleased: {
                          if (event.key === Qt.Key_Return) {
                              savedTabButton.onClicked()
                          }
                      }

                      // button toggle password type
                      Button {
                          id: togglePasswordType4
                          x: 390
                          y: 5
                          icon.source: "../images/phantomwalletlogo.png"
                          background: Qt.transparent
                          onClicked: {
                              if (importAccountPassword2.echoMode == TextInput.Normal) {
                                  importAccountPassword2.echoMode = TextInput.Password
                              } else {
                                  importAccountPassword2.echoMode = TextInput.Normal
                              }
                          }
                      }
                  }

                  // account password 2
                  TextField {
                      id: createAccountPassword2
                      echoMode: TextInput.Password
                      x: 163
                      y: 474
                      width: 432
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
                          id: togglePasswordType3
                          x: 390
                          y: 5
                          icon.source: "../images/phantomwalletlogo.png"
                          background: Qt.transparent
                          onClicked: {
                              if (createAccountPassword2.echoMode == TextInput.Normal) {
                                  createAccountPassword2.echoMode = TextInput.Password
                              } else {
                                  createAccountPassword2.echoMode = TextInput.Normal
                              }
                          }
                      }
                  }
                }

            }

            // importAccountTab
            Rectangle {
                id: existingAccountTab
                visible: true

                Item {
                  // dropdown accounts
                  ComboBox {
                      id: dropdownImport
                      model: [ "Account1", "Account2", "Account3" ]
                      x: 163
                      y: 403
                      width: 432
                      height: 60
                  }
                }

            }

            // Login button
            CustomButton {
              id: createTabButton
              text: qsTr("Import Account")
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

            // Import wallet
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