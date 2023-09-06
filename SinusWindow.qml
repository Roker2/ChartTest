import QtQuick
import QtCharts

ChartView {
	id: root

	animationOptions: ChartView.NoAnimation
	theme: ChartView.ChartThemeDark
	antialiasing: true

	property double step: 0.1
	property int dotsCount: 100

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
