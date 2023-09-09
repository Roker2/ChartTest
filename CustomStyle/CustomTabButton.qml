import QtQuick
import QtQuick.Controls

TabButton {
	id: root
	contentItem: Text {
		anchors.fill: parent

		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
		color: "white"
		text: root.text
	}

	background: Rectangle {
		anchors.fill: parent
		color: root.checked ? "#282828" : "black"
		border.color: "#38AD6B"
	}
}
