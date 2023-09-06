import QtQuick
import QtCharts
import QtQuick.Controls

ChartView {
	id: root

	animationOptions: ChartView.NoAnimation
	theme: ChartView.ChartThemeDark
	antialiasing: true

	property double step: 0.1
	property int dotsCount: 100

	TextField {
		id: dotsCountTextField

		anchors.right: parent.right
		anchors.top: parent.top
		anchors.topMargin: 9
		anchors.rightMargin: 9
		width: 100

		text: dotsCount
		color: root.titleColor
		inputMethodHints: Qt.ImhDigitsOnly
		validator: IntValidator {
			bottom: 1
		}
		background: Rectangle {
			anchors.fill: parent
			color: Qt.transparent
			border.color: splineSeries.color
		}
		onEditingFinished: {
			dotsCount = parseInt(dotsCountTextField.text)
		}
	}

	SplineSeries {
		id: splineSeries
		name: "Sin"
		axisX: xAxis
		axisY: yAxis
	}

	CategoryAxis {
		id: xAxis
		labelsPosition: CategoryAxis.AxisLabelsPositionOnValue
	}

	CategoryAxis {
		id: yAxis
		min: -1
		max: 1
		labelsPosition: CategoryAxis.AxisLabelsPositionOnValue

		CategoryRange {
			label: "-1"
			endValue: -1
		}

		CategoryRange {
			label: "0"
			endValue: 0
		}

		CategoryRange {
			label: "1"
			endValue: 1
		}
	}

	Timer {
		id: refreshTimer
		interval: 100
		running: true
		repeat: true
		onTriggered: {
			addPoint()
			xAxis.max = splineSeries.at(splineSeries.count - 1).x
			if (splineSeries.count < root.dotsCount) {
				xAxis.min = 0
			}
			else {
				xAxis.min = splineSeries.at(splineSeries.count - root.dotsCount - 1).x
			}
		}
	}

	function addPoint() {
		var x = splineSeries.count === 0 ? 0 : splineSeries.at(splineSeries.count - 1).x + step ;
		var y = Math.sin(x);
		splineSeries.append(x, y);
	}
}
