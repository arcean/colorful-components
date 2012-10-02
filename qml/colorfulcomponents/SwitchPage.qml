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
        title: "Switch"
    }

    Flickable {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: __MARGIN
        contentHeight: height + 1

        Label {
            id: normalLabel
            anchors.topMargin: __MARGIN
            anchors.top: parent.top
            anchors.left: parent.left

            text: "Label + standard switch"
        }

        Switch {
            id: normalSwitch
            anchors.right: parent.right
            anchors.verticalCenter: normalLabel.verticalCenter

            checked: true
        }

        Label {
            id: accentedLabel
            anchors.topMargin: __MARGIN
            anchors.top: normalLabel.bottom
            anchors.left: parent.left

            text: "Label + accented switch"
        }

        AccentedSwitch {
            id: accentedSwitch
            anchors.right: parent.right
            anchors.verticalCenter: accentedLabel.verticalCenter

            checked: true
        }

        LabelSwitch {
            id: labelSwitch
            anchors.topMargin: __MARGIN
            anchors.top: accentedLabel.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            text: "LabelSwitch component"
            checked: true
        }

    }
}
