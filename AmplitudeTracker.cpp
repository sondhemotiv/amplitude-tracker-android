#include "AmplitudeTracker.h"
#include <QtCore/private/qandroidextras_p.h>
#include <QJniObject>

AmplitudeTracker::AmplitudeTracker(QObject *parent) : QObject(parent) {}

void AmplitudeTracker::trackEvent(const QString &eventName) {
    // QJniObject activity = QtAndroidPrivate::activity();

    qInfo() << "nosh call trackEvent" << eventName;
    QJniObject::callStaticMethod<void>(
        "com/emotiv/consumerapp/MainActivity",
        "trackEvent",
        "(Ljava/lang/String;)V",
        QJniObject::fromString(eventName).object<jstring>()
        );
    qInfo() << "nosh call trackEvent" << eventName << " end";
}
