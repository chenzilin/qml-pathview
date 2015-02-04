#include <QDebug>
#include <QTimer>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include <QGuiApplication>
#include <QCommandLineParser>
#include <QQmlApplicationEngine>

#define CURRENT_INDEX 8

int main(int argc, char *argv[])
{
	QGuiApplication app(argc, argv);

	QQuickView viewer;

	switch (CURRENT_INDEX) {
	case 1:
		viewer.setSource(QUrl("qrc:///qml/changeone.qml"));
		break;
	case 2:
		viewer.setSource(QUrl("qrc:///qml/changetwo.qml"));
		break;
	case 3:
		viewer.setSource(QUrl("qrc:///qml/changethree.qml"));
		break;
	case 4:
		viewer.setSource(QUrl("qrc:///qml/changefour.qml"));
		break;
	case 5:
		viewer.setSource(QUrl("qrc:///qml/changefive.qml"));
		break;
	case 6:
		viewer.setSource(QUrl("qrc:///qml/changesix.qml"));
		break;
	case 7:
		viewer.setSource(QUrl("qrc:///qml/changeseven.qml"));
		break;
	case 8:
		viewer.setSource(QUrl("qrc:///qml/changeeight.qml"));
		break;
	default:
		viewer.setSource(QUrl("qrc:///qml/main.qml"));
		break;
	}

	viewer.show();
	return app.exec();
}
