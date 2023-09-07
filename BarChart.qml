import QtQuick
import QtCharts

ChartView {
	id: root

	animationOptions: ChartView.NoAnimation
	theme: ChartView.ChartThemeDark
	antialiasing: true

	BarSeries {
		id: barSeries

		axisX: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010", "2011", "2012" ] }

		property var currentIndex: undefined
		property var currentBarSet: undefined

		BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] }
		BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
		BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }

		onHovered: (status, index, barset) => {
			if (status) {
				currentIndex = index
				currentBarSet = barset
			} else {
				currentIndex = undefined
				currentBarSet = undefined
			}
		}
	}

	MouseArea {
		anchors.fill: parent
		hoverEnabled: true
		property bool isPressed: false
		property double originalPosY: 0.0
		property double originalSize: 0.0

		onPressed: (mouse) => {
			if (barSeries.currentIndex != undefined) {
				isPressed = true
				const point = root.mapToValue(Qt.point(mouse.x, mouse.y))
				originalSize = barSeries.currentBarSet.at(barSeries.currentIndex)
				originalPosY = point.y
			}
		}

		onPositionChanged: (mouse) => {
			if (barSeries.currentIndex != undefined
					&& isPressed) {
				const point = root.mapToValue(Qt.point(mouse.x, mouse.y))
				let deltaY = point.y - originalPosY
				barSeries.currentBarSet.replace(barSeries.currentIndex, originalSize + deltaY)
			}
		}

		onReleased: {
			isPressed = false
		}
	}
}
