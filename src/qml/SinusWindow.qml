import QtQuick
import QtCharts
import QtQuick.Controls

import CustomStyle
import ChartTest

ChartView {
	id: root

	property double step: 0.1

	function addPoint() {
		var x = splineSeries.count === 0 ? 0 : splineSeries.at(splineSeries.count - 1).x + step
		var y = Math.sin(x)
		splineSeries.append(x, y)
	}

	animationOptions: ChartView.NoAnimation
	theme: ChartView.ChartThemeDark
	antialiasing: true

	Button {
		anchors.right: dotsCountTextField.left
		anchors.top: parent.top
		anchors.topMargin: 9
		width: height
		height: dotsCountTextField.height
		background: Rectangle {
			anchors.fill: parent
			color: "transparent"
		}
		contentItem: Item {
			anchors.fill: parent

			ColoredImage {
				anchors.fill: parent
				color: "white"
				visible: !refreshTimer.running
				source: "qrc:/images/play.svg"
			}

			ColoredImage {
				anchors.fill: parent
				color: "white"
				visible: refreshTimer.running
				source: "qrc:/images/pause.svg"
			}
		}

		onClicked: refreshTimer.running = !refreshTimer.running
	}

	CustomTextField {
		id: dotsCountTextField

		anchors.right: parent.right
		anchors.top: parent.top
		anchors.topMargin: 9
		anchors.rightMargin: 9
		width: 100

		borderColor: splineSeries.color
		centerColor: "transparent"
		text: liveSinus.dotsCount
		inputMethodHints: Qt.ImhDigitsOnly
		validator: IntValidator {
			bottom: 1
		}
		onEditingFinished: {
			liveSinus.dotsCount = parseInt(dotsCountTextField.text)
		}
	}

	ScatterSeries {
		id: splineSeries
		name: "Sin"
		axisX: xAxis
		axisY: yAxis
	}

	ValueAxis {
		id: xAxis
		min: liveSinus.min
		max: liveSinus.max
	}

	ValueAxis {
		id: yAxis
		min: -1
		max: 1
	}

	LiveSinus {
		id: liveSinus
		onPointsAdded: liveSinus.update(splineSeries)
		Component.onCompleted: liveSinus.update(splineSeries)
	}

	Timer {
		id: refreshTimer
		interval: 100
		running: true
		repeat: true
		onTriggered: {
			liveSinus.moveRight();
		}
	}
}
