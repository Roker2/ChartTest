import QtQuick

Item {
	id: root

	property color borderColor: "red"
	property color centerColor: "yellow"
	property double verticalPercent: 0.2
	property double horizontalPercent: 0.05

	Rectangle {
		anchors.fill: parent
		gradient: Gradient {
			GradientStop { position: 0.0; color: root.borderColor }
			GradientStop { position: verticalPercent; color: root.centerColor }
			GradientStop { position: 1.0 - verticalPercent; color: root.centerColor }
			GradientStop { position: 1.0; color: root.borderColor }
		}
	}

	Rectangle {
		anchors.fill: parent
		gradient: Gradient {
			orientation: Gradient.Horizontal

			GradientStop { position: 0.0; color: root.borderColor }
			GradientStop { position: horizontalPercent; color: root.centerColor }
			GradientStop { position: 1.0 - horizontalPercent; color: root.centerColor }
			GradientStop { position: 1.0; color: root.borderColor }
		}
	}
}
