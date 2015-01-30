import QtQuick 2.0

Rectangle {
	width: 400
	height: 230

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
			Text {
				anchors { top: myIcon.bottom; horizontalCenter: parent.horizontalCenter }
				text: name
				smooth: true
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
			startY: 50
			PathAttribute { name: "iconScale"; value: 0.5 }
			PathQuad { x: 200; y: 150; controlX: 50; controlY: 200 }
			PathAttribute { name: "iconScale"; value: 1.0 }
			PathQuad { x: 390; y: 50; controlX: 350; controlY: 200 }
			PathAttribute { name: "iconScale"; value: 0.5 }
		}

		Keys.onLeftPressed: if (!moving) decrementCurrentIndex()
		Keys.onRightPressed: if (!moving) incrementCurrentIndex()
	}
}
