import QtQuick 1.1
import com.nokia.meego 1.0

Item {

    property alias title: title.text
    property alias model: selectionDialog.model
    property string initialValue
    property string currentValue

    signal valueChosen(string value)

    width: parent.width
    height: 80

    function getInitialValue() {
        var found = false;
        var i = 0;
        while ((!found) && (i < model.count)) {
            if (model.get(i).value == initialValue) {
                selectionDialog.selectedIndex = i;
                found = true;
            }
            i++;
        }
        currentValue = initialValue;
    }

    onInitialValueChanged: getInitialValue()
    Component.onCompleted: getInitialValue()

    Column {

        anchors { left: parent.left; leftMargin: 10; verticalCenter: parent.verticalCenter }

        Label {
            id: title

            font.bold: true
            color: __TEXT_COLOR
            verticalAlignment: Text.AlignVCenter
        }

        Label {
            id: subTitle

            color: __ACTIVE_COLOR_TEXT
            verticalAlignment: Text.AlignVCenter
            text: model.get(selectionDialog.selectedIndex).name
        }
    }

    Image {
        id: image
        anchors { right: parent.right; rightMargin: 20; verticalCenter: parent.verticalCenter }
        source: (theme.inverted) ? "internal_gfx/textinput-combobox-arrow.png" : "internal_gfx/common-combobox-arrow.png"
        sourceSize.width: width
        sourceSize.height: height
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent
        onClicked: selectionDialog.open()
    }

    Rectangle {
        id: highlight
        anchors { fill: parent; bottomMargin: 1; topMargin: 1 }
        color: __ACTIVE_COLOR_TEXT
        opacity: 0.5
        visible: mouseArea.pressed
        smooth: true
    }

    AccentedSelectionDialog {
        id: selectionDialog

        titleText: title.text
        onAccepted: {
            currentValue = model.get(selectedIndex).value;
            valueChosen(model.get(selectedIndex).value);
        }
    }
}
