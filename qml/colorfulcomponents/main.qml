import QtQuick 1.1
import com.nokia.meego 1.0
import "components"
import "GetColor.js" as Color
PageStackWindow {
    id: appWindow

    initialPage: mainPage

    // Base:
    property string __APP_NAME: "Colorful-components"
    property string __APP_VERSION: "0.1.2"
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

    // ACTIVE_COLOR_TEXT:
    // - color1 (basement): #1180DD
    // - color2:  #61B500
    // - color3:  #3C870C
    // - color4:  #337608
    // - color5:  #2F6500
    // - color6:  #16ABCF
    // - color7:  #007CC7
    // - color8:  #0066BA
    // - color9:  #1C50AD
    // - color10: #6300BA
    // - color11: #850CB8
    // - color12: #CA09B8
    // - color13: #E5009F
    // - color14: #EC5400
    // - color15: #E7640A
    // - color16: #F47119
    // - color17: #FC8300
    // - color18: #EA9307
    // - color19: #EFAF11

    Component.onCompleted: {
        // Uncomment the following line to change the theme to the dark one
        //theme.inverted = true;
    }

    // Background settigns:
    /*platformStyle: PageStackWindowStyle {
        background: "image://theme/meegotouch-pin-background"
        backgroundFillMode: Image.Stretch
    }*/

    AboutDialog {
        id: aboutDialog

        message: "Technology preview for the colorful-components package. <br><br> &copy; Tomasz Pieniążek 2012, 2013<br>"
        icon: "gfx/info.png"
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
            MenuItem {
                text: qsTr("About")
                onClicked: aboutDialog.open()
            }
            Repeater {
                model: 19
                MenuItem {
                    text: qsTr("color" + (index + 1))
                    onClicked: {
                        if (text === "color1")
                            __ACTIVE_COLOR = "";
                        else
                            __ACTIVE_COLOR = text;

                        __ACTIVE_COLOR_TEXT = Color.getColor(text);
                    }
                }
            }
        }
    }
}
