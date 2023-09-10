import QtQuick
import QtQuick.Controls

TextField {
	id: root

	property color borderColor: "red"
	property color centerColor: "yellow"

	color: "white"
	background: Rectangle {
		anchors.fill: parent
		color: root.centerColor
		border.color: root.borderColor

		RectangleGradient {
			anchors.fill: parent
			borderColor: root.borderColor
			centerColor: root.centerColor
		}
	}
}
