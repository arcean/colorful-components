import QtQuick 1.1
import com.nokia.meego 1.0
import "components"

Page {
    tools: ToolBarLayout {
        ToolIcon {
            platformIconId: "toolbar-back"
            onClicked: appWindow.pageStack.pop()
        }
    }

    PageHeader {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        title: "Header"

        visible: true
    }

    ClickablePageHeader {
        id: clickableHeader
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        title: "Header"

        visible: false
    }

    Flickable {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: __MARGIN
        contentHeight: height + 1

        ButtonColumn {
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: __MARGIN
            anchors.rightMargin: __MARGIN
            checkedButton: normalButton

            AccentedButton {
                id: noneButton
                text: qsTr("None")

                onClicked: {
                    header.visible = clickableHeader.visible = false;
                }
            }

            AccentedButton {
                id: normalButton
                text: qsTr("Normal page header")

                onClicked: {
                    header.visible = true;
                    clickableHeader.visible = false;
                }
            }

            AccentedButton {
                id: clickableButton
                text: qsTr("Clickable page header")

                onClicked: {
                    header.visible = false;
                    clickableHeader.visible = true;
                    clickableHeader.subtitle = "";
                }
            }

            AccentedButton {
                id: subtitleButton
                text: qsTr("Clickable header with subtitle")

                onClicked: {
                    header.visible = false;
                    clickableHeader.visible = true;
                    clickableHeader.subtitle = "Subtitle";
                }
            }
        }
    }
}
