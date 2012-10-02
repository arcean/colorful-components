import QtQuick 1.0
import com.nokia.meego 1.0

Item {
    id: root

    width: parent ? parent.width : 0
    height: parent ? parent.height : 0

    property alias title: titleBar.children
    property alias content: contentField.children
    property alias buttons: buttonRow.children
    property Item visualParent
    property int status: DialogStatus.Closed

    property alias acceptButtonText: acceptButton.text
    property alias rejectButtonText: rejectButton.text

    signal accepted
    signal rejected

    property QtObject platformStyle: SheetStyle { }

    //Deprecated, TODO Remove this on w13
    property alias style: root.platformStyle

    function reject() {
        close();
        rejected();
    }

    function accept() {
        close();
        accepted();
    }

    visible: status != DialogStatus.Closed;

    function open() {
        parent = visualParent || __findParent();
        sheet.state = "";
    }

    function close() {
        sheet.state = "closed";
    }

    function __findParent() {
        var next = parent;
        while (next && next.parent && next.objectName != "appWindowContent") {
            next = next.parent;
        }
        return next;
    }

    function getButton(name) {
        for (var i=0; i<buttons.length; ++i) {
            if (buttons[i].objectName == name)
                return buttons[i];
        }
        return undefined;
    }

    MouseArea {
        id: blockMouseInput
        anchors.fill: parent
    }

    Item {
        id: sheet

        width: parent.width
        height: parent.height

        clip: true

        property int transitionDurationIn: 300
        property int transitionDurationOut: 450

        state: "closed"

        function transitionStarted() {
            status = (state == "closed") ? DialogStatus.Closing : DialogStatus.Opening;
        }

        function transitionEnded() {
            status = (state == "closed") ? DialogStatus.Closed : DialogStatus.Open;
        }

        states: [
            // Closed state.
            State {
                name: "closed"
                PropertyChanges { target: sheet; y: height; }
            }
        ]

        transitions: [
            // Transition between open and closed states.
            Transition {
                from: ""; to: "closed"; reversible: false
                SequentialAnimation {
                    ScriptAction { script: if (sheet.state == "closed") { sheet.transitionStarted(); } else { sheet.transitionEnded(); } }
                    PropertyAnimation { properties: "y"; easing.type: Easing.InOutQuint; duration: sheet.transitionDurationOut }
                    ScriptAction { script: if (sheet.state == "closed") { sheet.transitionEnded(); } else { sheet.transitionStarted(); } }
                }
            },
            Transition {
                from: "closed"; to: ""; reversible: false
                SequentialAnimation {
                    ScriptAction { script: if (sheet.state == "") { sheet.transitionStarted(); } else { sheet.transitionEnded(); } }
                    PropertyAnimation { properties: "y"; easing.type: Easing.OutQuint; duration: sheet.transitionDurationIn }
                    ScriptAction { script: if (sheet.state == "") { sheet.transitionEnded(); } else { sheet.transitionStarted(); } }
                }
            }
        ]

        BorderImage {
            source: platformStyle.background
            width: parent.width
            anchors.top: header.bottom
            anchors.bottom: parent.bottom
            Item {
                id: contentField
                anchors.fill: parent
            }
        }

        Item {
            id: header
            width: parent.width
            height: headerBackground.height
            BorderImage {
                id: headerBackground
                border {
                    left: platformStyle.headerBackgroundMarginLeft
                    right: platformStyle.headerBackgroundMarginRight
                    top: platformStyle.headerBackgroundMarginTop
                    bottom: platformStyle.headerBackgroundMarginBottom
                }
                source: platformStyle.headerBackground
                width: header.width
            }
            Item {
                id: buttonRow
                anchors.fill: parent
                SheetButton {
                    id: rejectButton
                    objectName: "rejectButton"
                    anchors.left: parent.left
                    anchors.leftMargin: root.platformStyle.rejectButtonLeftMargin
                    anchors.verticalCenter: parent.verticalCenter
                    visible: text != ""
                    onClicked: close()
                }
                SheetButton {
                    id: acceptButton
                    objectName: "acceptButton"
                    anchors.right: parent.right
                    anchors.rightMargin: root.platformStyle.acceptButtonRightMargin
                    anchors.verticalCenter: parent.verticalCenter
                    platformStyle: SheetButtonAccentStyle {
                        background: "image://theme/" + __ACTIVE_COLOR + "-" + "meegotouch-sheet-button-accent"+__invertedString+"-background"
                        pressedBackground: "image://theme/" + __ACTIVE_COLOR + "-" + "meegotouch-sheet-button-accent"+__invertedString+"-background-pressed"
                        disabledBackground: "image://theme/" + __ACTIVE_COLOR + "-" + "meegotouch-sheet-button-accent"+__invertedString+"-background-disabled"
                    }
                    visible: text != ""
                    onClicked: close()
                }
                Component.onCompleted: {
                    acceptButton.clicked.connect(accepted)
                    rejectButton.clicked.connect(rejected)
                }
            }
            Item {
                id: titleBar
                anchors.fill: parent
            }
        }
    }
}
