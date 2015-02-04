import QtQuick 2.0

Rectangle {
	width: 200
	height: 400

	ListModel {
		id: appModel

		ListElement { name: "N" }
		ListElement { name: "P" }
		ListElement { name: "D" }
		ListElement { name: "R" }
	}

	Component {
		id: appDelegate

		Column {
			property real textOpacity: PathView.textOpacity

			id: wrapper
			Item {
				width: 100
				height: 100

				Text {
					id: myText
					anchors { verticalCenter: parent.verticalCenter; horizontalCenter: parent.horizontalCenter }
					text: name
					color: wrapper.PathView.isCurrentItem ? "blue" : "red"
//					opacity: wrapper.PathView.isCurrentItem ? 1.0 : 0.5
					opacity: textOpacity
					font.pointSize: wrapper.PathView.isCurrentItem ? 60 : 35
					smooth: true
				}

				MouseArea {
					anchors.fill: parent
					onClicked: view.currentIndex = index
				}
			}
		}
	}

	Component {
		id: appHighlight

		Rectangle {
			width: 80
			height: 80;
			color: "lightsteelblue"
		}
	}

	PathView {
		id: view
		anchors.fill: parent
		highlight: appHighlight
		preferredHighlightBegin: 0.5
		preferredHighlightEnd: 0.5
		focus: true
		model: appModel
		delegate: appDelegate
		path: Path {
			startX: 100
			startY: 10
			PathAttribute { name: "textOpacity"; value: 0 }
			PathQuad { x: 100; y: 200; controlX: 100; controlY: 50 }
			PathAttribute { name: "textOpacity"; value: 1.0 }
			PathQuad { x: 100; y: 390; controlX: 100; controlY: 350 }
			PathAttribute { name: "textOpacity"; value: 0 }
		}

		Keys.onUpPressed: if (!moving) decrementCurrentIndex()
		Keys.onDownPressed: if (!moving) incrementCurrentIndex()
	}
}
