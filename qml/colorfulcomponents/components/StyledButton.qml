import QtQuick 1.0
import com.nokia.meego 1.0

Button {
    style: ButtonStyle {
        background: "image://theme/" + __ACTIVE_COLOR + "-" + "meegotouch-button-accent" + __invertedString + "-background" + (position ? "-" + position : "")
        pressedBackground: "image://theme/" + __ACTIVE_COLOR + "-" + "meegotouch-button-accent" + __invertedString + "-background-pressed" + (position ? "-" + position : "")
        checkedBackground: "image://theme/" + __ACTIVE_COLOR + "-" + "meegotouch-button-accent" + __invertedString + "-background-selected" + (position ? "-" + position : "")
        checkedDisabledBackground: "image://theme/" + __ACTIVE_COLOR + "-" + "meegotouch-button-accent" + __invertedString + "-background-disabled-selected" + (position ? "-" + position : "")
        textColor: "white"
    }
}
