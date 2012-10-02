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
        title: "Button"
    }

    HarmattanTimePicker {
        id: timePicker
        anchors.centerIn: parent

        function orientationSuffix() {
            if (screen.currentOrientation === Screen.Portrait || screen.currentOrientation === Screen.PortraitInverted )
                return "portrait"
            else
                return "landscape"
        }

        backgroundImage: "image://theme/meegotouch-timepicker-light-1-" + orientationSuffix()
        hourDotImage: "image://theme/meegotouch-timepicker-disc-hours-" + orientationSuffix()
        minutesDotImage: "image://theme/meegotouch-timepicker-disc-minutes-" + orientationSuffix()
    }
}
