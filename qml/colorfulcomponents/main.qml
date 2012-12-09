import QtQuick 1.1
import com.nokia.meego 1.0
import "components"
PageStackWindow {
    id: appWindow

    initialPage: mainPage

    // Base:
    property string __APP_NAME: "Colorful-components"
    property string __APP_VERSION: "0.0.3"
    // Theme:
    property string __TEXT_COLOR: theme.inverted ? "white" : "black"
    property string __ACTIVE_COLOR: "color6"
    property string __ACTIVE_COLOR_TEXT: "#16ABCF"
    property string __DISABLED_COLOR_TEXT: "#797979"
    // Font size:
    property int __SMALL_FONT_SIZE: 18
    property int __STANDARD_FONT_SIZE: 24
    property int __HEADER_FONT_SIZE: 32
    property int __LARGE_FONT_SIZE: 40
    // Margins:
    property int __MARGIN: 16

    Component.onCompleted: {
        // Uncomment the following line to change the theme to the dark one
        //theme.inverted = true;
    }

    // Background settigns:
    /*platformStyle: PageStackWindowStyle {
        background: "image://theme/meegotouch-pin-background"
        backgroundFillMode: Image.Stretch
    }*/

    AccentedSheet {
        id: ax
    }

    MainPage {
        id: mainPage
    }

    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status === DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem {
                text: qsTr("Invert theme")
                onClicked: theme.inverted = !theme.inverted
            }
        }
    }
}
