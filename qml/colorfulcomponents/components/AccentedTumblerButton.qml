import QtQuick 1.1
import com.nokia.meego 1.0
import com.nokia.extras 1.1

TumblerButton {
    style: TumblerButtonStyle {
        pressedBackground: "image://theme/" + __ACTIVE_COLOR + "-" + "meegotouch-button" + __invertedString + "-background-pressed"
        disabledBackground: "image://theme/" + __ACTIVE_COLOR + "-" + "meegotouch-button" + __invertedString + "-background-disabled"
    }
}
