#include "AmplitudeTracker.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>s

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // Register AmplitudeTracker with QML
    AmplitudeTracker amplitudeTracker;
    engine.rootContext()->setContextProperty("amplitudeTracker", &amplitudeTracker);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("amplitude-tracker-android", "Main");

    return app.exec();
}
