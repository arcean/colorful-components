import QtQuick 1.1
import com.nokia.meego 1.0
import "components"
import "components/DatePickerData"

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
        title: "HarmattanDatePicker"
    }

    Flickable {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: __MARGIN
        contentHeight: datePicker.height + 1

        HarmattanDatePicker {
            id: datePicker

            anchors.centerIn: parent

            function orientationString() {
                if (screen.currentOrientation === Screen.Portrait || screen.currentOrientation === Screen.PortraitInverted )
                    return "portrait"
                else
                    return "landscape"
            }

            platformStyle: DatePickerStyle {
                orientationString: datePicker.orientationString()
            }
        }
    }
}
