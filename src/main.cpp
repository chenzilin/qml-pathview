#include <QDebug>
#include <QTimer>
#include <QQuickView>
#include <QQmlEngine>
#include <QQmlContext>
#include <QGuiApplication>
#include <QCommandLineParser>
#include <QQmlApplicationEngine>

#define CURRENT_INDEX 0

int main(int argc, char *argv[])
{
	QGuiApplication app(argc, argv);

	QCommandLineParser parser;
	QCommandLineOption serialOption(QStringList() << "s" << "serial port device name", "specify serial port device", "serial", "ttyS2");
	parser.addOption(serialOption);
	parser.process(app);

	QString serial = "ttyS2";
	if (parser.isSet(serialOption))
		serial = parser.value(serialOption);

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
	default:
		viewer.setSource(QUrl("qrc:///qml/main.qml"));
		break;
	}

	viewer.show();

	return app.exec();
}
