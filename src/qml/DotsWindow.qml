import QtQuick
import QtCharts
import QtQuick.Controls

ChartView {
	id: root

	title: "Dots"
	theme: ChartView.ChartThemeDark
	antialiasing: true
	animationOptions: ChartView.SeriesAnimations

	ScatterSeries {
		id: scatterSeries

		name: "Random dots"
		XYPoint { x: 0; y: 0.0 }
		XYPoint { x: 1.1; y: 3.2 }
		XYPoint { x: 1.9; y: 2.4 }
		XYPoint { x: 2.1; y: 2.1 }
		XYPoint { x: 2.9; y: 2.6 }
		XYPoint { x: 3.4; y: 2.3 }
		XYPoint { x: 4.1; y: 3.1 }

		onDoubleClicked: (point) => {
			remove(point.x, point.y)
		}

		onHovered: (point, state) => {
			if (state) {
				const position = mapToPosition(point)
				toolTip.x = position.x
				toolTip.y = position.y - toolTip.height
				toolTip.animatedShow("x: %1, y: %2"
							 .arg(point.x)
							 .arg(point.y))
			} else {
				toolTip.animatedHide()
			}
		}
	}

	ToolTip {
		id: toolTip

		property int animationDuration: 100

		function animatedShow(toolTipText) {
			if (hideAnimation.running)
				hideAnimation.stop()
			if (showAnimation.running)
				showAnimation.stop()

			toolTip.scale = 1
			toolTip.show(toolTipText)
			toolTip.scale = 0
			showAnimation.start()
		}

		function animatedHide() {
			hideAnimation.start()
		}

		contentItem: Text {
			anchors.verticalCenter: parent.verticalCenter
			anchors.horizontalCenter: parent.horizontalCenter
			text: toolTip.text
			color: "white"
		}

		background: Rectangle {
			anchors.fill: parent
			color: "black"
			border.color: scatterSeries.color
		}

		PropertyAnimation {
			id: hideAnimation
			target: toolTip
			property: "scale"
			to: 0
			duration: animationDuration

			onStopped: toolTip.hide()
		}

		PropertyAnimation {
			id: showAnimation
			target: toolTip
			property: "scale"
			to: 1
			duration: animationDuration
		}
	}
}
