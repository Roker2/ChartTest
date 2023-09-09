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
		border.color: "#38AD6B"
		gradient: Gradient {
			GradientStop {
				position: 0.0
				color: "black"
			}
			GradientStop {
				position: 1.0
				color: root.checked ? "#3D3D3D" : "black"
			}
		}
	}
}
