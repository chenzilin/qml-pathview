import QtQuick 2.0

Rectangle {
	width: 500
	height: 230
	color: "black"

	ListModel {
		id: appModel
		ListElement { name: "Music"; icon: "qrc:/images/AudioPlayer_48.png" }
		ListElement { name: "Movies"; icon: "qrc:/images/VideoPlayer_48.png" }
		ListElement { name: "Camera"; icon: "qrc:/images/Camera_48.png" }
		ListElement { name: "Calendar"; icon: "qrc:/images/DateBook_48.png" }
		ListElement { name: "Messaging"; icon: "qrc:/images/EMail_48.png" }
		ListElement { name: "Todo List"; icon: "qrc:/images/TodoList_48.png" }
		ListElement { name: "Contacts"; icon: "qrc:/images/AddressBook_48.png" }
	}

	Component {
		id: appDelegate

		Item {
			width: 100
			height: 100
			scale: PathView.iconScale

			Image {
				id: myIcon
				y: 20; anchors.horizontalCenter: parent.horizontalCenter
				source: icon
				smooth: true
			}
			Image {
				id: subImage
				y:-60
				source: icon
				anchors.horizontalCenter: parent.horizontalCenter
				smooth: true
				opacity: 0.3
				transform: Rotation { origin.x: 0; origin.y: 100; axis { x: 1; y: 0; z: 0 } angle: 180 }
			}
			Text {
				anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter }
				text: name
				smooth: true
				color: "green"
			}

			MouseArea {
				anchors.fill: parent
				onClicked: view.currentIndex = index
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
			startX: 10
			startY: 100
			PathAttribute { name: "iconScale"; value: 0.5 }
			PathQuad { x: 250; y: 100; controlX: 50; controlY: 100 }
			PathAttribute { name: "iconScale"; value: 1.0 }
			PathQuad { x: 490; y: 100; controlX: 450; controlY: 100 }
			PathAttribute { name: "iconScale"; value: 0.5 }
		}

		Keys.onLeftPressed: if (!moving) decrementCurrentIndex()
		Keys.onRightPressed: if (!moving) incrementCurrentIndex()
	}
}
