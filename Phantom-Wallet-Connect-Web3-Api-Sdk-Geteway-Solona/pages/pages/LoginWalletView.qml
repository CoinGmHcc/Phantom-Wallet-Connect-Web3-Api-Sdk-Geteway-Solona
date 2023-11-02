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
    id: containerLoginWalletView
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
          top: containerLoginWalletView.top
          topMargin: 40
        }
        source: "../images/phantomwalletlogo.png"
        width: 100
        height: 100
    }

    // Label title
    Label {
        id: labelPhantom
        text: "Phantom Wallet"
        font.family: customGoogleFont.name
        font.pixelSize: 40
        anchors {
          horizontalCenter: parent.horizontalCenter
          top: logoPhantom.bottom
          topMargin: 20
        }
    }

    // TabBar login options
    TabBar {
        id: tabbarLogin
        x: 93
        y: 283
        width: parent.width * 0.75
        currentIndex: 0
        TabButton {
            text: qsTr("SAVED")
        }
        TabButton {
            text: qsTr("PRIVATE")
        }
        TabButton {
            text: qsTr("LEDGER (SOON)")
            enabled: false
            checkable: false
        }
        TabButton {
            text: qsTr("SAFEPAL (SOON)")
            enabled: false
            checkable: false
        }
    }

    // TabBar toggle views
    StackLayout {
        id: stackLayoutLogin
        x: 112
        width: 540
        height: 310
        currentIndex: tabbarLogin.currentIndex
        anchors {
          top: logoPhantom.bottom
          topMargin: 190
        }

        onCurrentIndexChanged: {
            switch (currentIndex) {
            case 0:
                savedTab.visible = true;
                privateTab.visible = false;
                //ledgerTab.visible = false;
                break;
            case 1:
                savedTab.visible = false;
                privateTab.visible = true;
                //ledgerTab.visible = false;
                break;
            case 2:
                savedTab.visible = false;
                privateTab.visible = false;
                //ledgerTab.visible = true;
                break;
            }
        }
    }

    // savedTab Page
    Rectangle {
        id: savedTab
        visible: true

        Item {
            // dropdown accounts
            ComboBox {
                id: dropdownSaved
                model: [ "Account1", "Account2", "Account3" ]
                x: 163
                y: 373
                width: 432
                height: 60
            }

            // account password
            TextField {
                id: inputSavedPassword
                echoMode: TextInput.Password
                x: 163
                y: 444
                width: 432
                height: 60
                //validator: IntValidator {bottom: 0; top: 10;}
                placeholderText: qsTr("Enter your password")
                Keys.onReleased: {
                    if (event.key === Qt.Key_Return) {
                        savedTabButton.onClicked()
                    }
                }

                Text {
                    text: FontAwesome.eye
                    font.family: FontAwesome.fontFamilySolid
                    font.pixelSize: 16
                    color: "#fff"
                    font.styleName: "Regular"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.right
                    anchors.leftMargin: 300
                    opacity: 0.75
                }
            }

            // Login button
            CustomButton {
              id: savedTabButton
              text: qsTr("Login")
              background: Rectangle {
                  id: savedTabButtonCustom
                  implicitWidth: 100
                  implicitHeight: 25
                  border {
                    width: 2
                    color: Theme.buttonBorderColor
                  }
                  radius: 20
                  color: Theme.containerBackgroundColor
              }
              onHoveredChanged: hovered ? savedTabButtonCustom.color = Theme.buttonbackgroundColor : savedTabButtonCustom.color = Theme.containerBackgroundColor;
              onClicked: switchMainViews(3)
            }
        }

    }

    // privateTab Page
    Rectangle {
        id: privateTab
        visible: false

        Item {
            TextField {
                id: inputPrivateKey
                echoMode: TextInput.Password
                x: 163
                y: 373
                width: 432
                height: 60
                placeholderText: qsTr("Enter your private key")
                Keys.onReleased: {
                    if (event.key === Qt.Key_Return) {
                        privateTabButton.onClicked()
                    }
                }
                Text {
                    text: FontAwesome.eye
                    font.family: FontAwesome.fontFamilySolid
                    font.pixelSize: 16
                    color: "#fff"
                    font.styleName: "Regular"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.right
                    anchors.leftMargin: 300
                    opacity: 0.75
                }
            }

            // Login button
            CustomButton {
              id: privateTabButton
              text: qsTr("Login")
              background: Rectangle {
                  id: privateTabButtonCustom
                  implicitWidth: 100
                  implicitHeight: 25
                  border {
                    width: 2
                    color: Theme.buttonBorderColor
                  }
                  radius: 20
                  color: Theme.containerBackgroundColor
              }
              onHoveredChanged: hovered ? privateTabButtonCustom.color = Theme.buttonbackgroundColor : privateTabButtonCustom.color = Theme.containerBackgroundColor;
              onClicked: {
                //Theme.currentAddress = inputPrivateKey.text
                //console.log(Theme.currentAddress)
                //PortfolioView.labelCurrentAddress = inputPrivateKey.text
                //console.log(PortfolioView.labelCurrentAddress)
                switchMainViews(3)
              }
            }
        }
    }

    // Create wallet
    Button {
        id: buttonCreateWallet
        x: 230
        y: 630
        flat: true
        opacity: 0.8
        anchors {
          left: containerLoginWalletView.left
          leftMargin: 200
        }
        text: qsTr("Create wallet")
        onClicked: switchMainViews(1)

        Text {
            text: FontAwesome.plusCircle
            font.family: FontAwesome.fontFamilySolid
            font.pixelSize: 20
            color: "#fff"
            font.styleName: "Solid"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.left
            anchors.leftMargin: 300
            //opacity: 0.75
        }
    }

    // Import wallet
    Button {
        id: buttonImportWallet
        x: 426
        y: 630
        flat: true
        opacity: 0.8
        anchors {
          right: containerLoginWalletView.right
          rightMargin: 200
        }
        text: qsTr("Import wallet")
        onClicked: switchMainViews(2)

        Text {
            text: FontAwesome.cloudUploadAlt
            font.family: FontAwesome.fontFamilySolid
            font.pixelSize: 20
            color: "#fff"
            font.styleName: "Solid"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.left
            anchors.leftMargin: 300
            //opacity: 0.75
        }

    }

}